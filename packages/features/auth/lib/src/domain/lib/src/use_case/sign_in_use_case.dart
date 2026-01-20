
import 'package:auth_domain/src/repository/_repository.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignInUseCase extends BaseUseCase<AppUserEntity, SignInForm> {
  final AuthRepository _authRepository;
  final AppUserRepository _appUserRepository;

  SignInUseCase({required AuthRepository authRepository, required AppUserRepository appUserRepository})
    : _authRepository = authRepository,
      _appUserRepository = appUserRepository;

  @override
  Future<TaskResult<AppUserEntity>> execute({required SignInForm params}) async {
    try {
      var authResult = await _authRepository.signIn(params);
      switch (authResult) {
        case FailedResult<AppUserIdValue>():
          return FailedResult.fromFailure(authResult);

        case SuccessResult<AppUserIdValue>():
          var userResult = await _appUserRepository.findUserById(authResult.result);
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
