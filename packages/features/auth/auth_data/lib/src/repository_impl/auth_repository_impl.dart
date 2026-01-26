
import 'package:core/core.dart';
import 'package:auth_domain/auth_domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AppAuthenticatorService _authenticatorService;

  AuthRepositoryImpl({required AppAuthenticatorService authenticatorService}) : _authenticatorService = authenticatorService;

  @override
  Future<TaskResult<void>> forgotPassword(EmailAddressValue email) async {
    try {
      return await _authenticatorService.forgotPassword(email);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form) async {
    try {
      return await _authenticatorService.signIn(form);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form) async {
    try {
      return await _authenticatorService.signUp(form);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
