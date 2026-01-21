import 'package:foundation/src/auth/value_objects/_value_objects.dart';
import 'package:foundation/src/auth/forms/_forms.dart';
import 'package:foundation/src/auth/entities/_entities.dart';
import 'package:base/base.dart';


abstract class AppAuthenticatorService {

  Future<TaskResult<AuthUser>> getCurrentUser();

  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form);

  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form);

  Future<TaskResult<void>> forgotPassword(EmailAddressValue email);

}