import 'package:foundation/src/auth/value_objects/_value_objects.dart';

class SignInForm {
  final EmailAddressValue email;
  final String password;

  SignInForm({required this.password, required this.email});
}
