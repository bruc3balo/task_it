import 'package:core/core.dart';

abstract class AppAuthenticatorService {

  Future<TaskResult<AuthUser>> getCurrentUser();

  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form);

  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form);

  Future<TaskResult<void>> forgotPassword(EmailAddressValue email);

}