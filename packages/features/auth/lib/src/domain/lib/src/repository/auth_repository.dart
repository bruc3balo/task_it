import 'package:auth_domain/src/forms/_forms.dart';
import 'package:auth_domain/src/value_objects/_value_objects.dart';
import 'package:base/base.dart';

abstract class AuthRepository {
  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form);

  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form);

  Future<TaskResult<void>> forgotPassword(EmailAddressValue email);
}
