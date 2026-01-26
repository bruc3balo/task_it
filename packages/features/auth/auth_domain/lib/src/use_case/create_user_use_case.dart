import 'package:core/core.dart';
import 'package:auth_domain/auth_domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CreateUserUseCase extends BaseUseCase<AppUserEntity, DisplayNameValue> {
  final AppUserRepository _appUserRepository;
  final AppAuthenticatorService _authenticatorService;

  CreateUserUseCase({required AppUserRepository appUserRepository, required AppAuthenticatorService authenticatorService})
    : _appUserRepository = appUserRepository,
      _authenticatorService = authenticatorService;

  //User must be already logged in
  @override
  Future<TaskResult<AppUserEntity>> execute({required DisplayNameValue params}) async {
    try {
      var currentUserResult = await _authenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          return FailedResult.fromFailure(currentUserResult);
        case SuccessResult<AuthUser>():
          var authUser = currentUserResult.result;
          return await _appUserRepository.createUser(
            CreateUserAccountForm(displayName: params, email: authUser.emailAddressValue, userId: authUser.id),
          );
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
