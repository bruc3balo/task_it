import 'package:auth_domain/src/entities/_entities.dart';
import 'package:auth_domain/src/forms/_forms.dart';
import 'package:auth_domain/src/value_objects/_value_objects.dart';
import 'package:auth_domain/src/repository/_repository.dart';
import 'package:base/base.dart';

class SignUpUseCase extends BaseUseCase<AppUserEntity, CreateAccountForm> {
  final AuthRepository _authRepository;
  final AppUserRepository _appUserRepository;

  SignUpUseCase({required AuthRepository authRepository, required AppUserRepository appUserRepository})
    : _authRepository = authRepository,
      _appUserRepository = appUserRepository;

  @override
  Future<TaskResult<AppUserEntity>> execute({required CreateAccountForm params}) async {
    try {
      //TODO: CHeck if user has account, if so, login instead of account creation
      var authResult = await _authRepository.signUp(SignUpForm(password: params.password.value, email: params.email));
      switch (authResult) {
        case FailedResult<AppUserIdValue>():
          //TODO: Depending on the type of failure
          return FailedResult.fromFailure(authResult);

        case SuccessResult<AppUserIdValue>():
          var userResult = await _appUserRepository.createUser(params);
          switch (userResult) {
            case FailedResult<AppUserEntity>():
              return FailedResult.fromFailure(userResult);

            case SuccessResult<AppUserEntity>():
              return userResult;
          }
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), trace: trace));
    }
  }
}
