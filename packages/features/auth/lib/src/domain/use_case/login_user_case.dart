import 'package:auth/src/domain/entities/app_user_entity.dart';
import 'package:auth/src/domain/forms/create_new_account_form.dart';
import 'package:auth/src/domain/forms/create_new_user_form.dart';
import 'package:auth/src/domain/forms/login_form.dart';
import 'package:auth/src/domain/repository/app_user_repository.dart';
import 'package:auth/src/domain/repository/auth_repository.dart';
import 'package:auth/src/domain/value_objects/app_user_id_value.dart';
import 'package:base/base.dart';

class LoginUserCase extends BaseUseCase<AppUserEntity, LoginForm> {
  final AuthRepository _authRepository;
  final AppUserRepository _appUserRepository;

  LoginUserCase({required AuthRepository authRepository, required AppUserRepository appUserRepository})
    : _authRepository = authRepository,
      _appUserRepository = appUserRepository;

  @override
  Future<TaskResult<AppUserEntity>> execute({required LoginForm params}) async {
    try {
      var authResult = await _authRepository.loginToAccount(params);
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
