import 'package:core/core.dart';
import 'package:auth_domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCurrentUserUseCase extends BaseUseCase<AppUserEntity, dynamic> {
  final AppUserRepository _appUserRepository;
  final AppAuthenticatorService _authenticatorService;

  GetCurrentUserUseCase({required AppUserRepository appUserRepository, required AppAuthenticatorService authenticatorService})
    : _appUserRepository = appUserRepository,
      _authenticatorService = authenticatorService;

  //User must be already logged in
  @override
  Future<TaskResult<AppUserEntity>> execute({params}) async {
    try {
      var currentUserResult = await _authenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          return FailedResult.fromFailure(currentUserResult);
        case SuccessResult<AuthUser>():
          var authUser = currentUserResult.result;
          return await _appUserRepository.findUserById(authUser.id);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
