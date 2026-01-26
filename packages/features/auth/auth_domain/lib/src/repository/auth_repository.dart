import 'package:core/core.dart';

abstract class AuthRepository {
  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form);

  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form);

  Future<TaskResult<void>> forgotPassword(EmailAddressValue email);
}
