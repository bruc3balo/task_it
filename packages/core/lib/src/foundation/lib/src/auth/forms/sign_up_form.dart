import 'package:foundation/src/auth/value_objects/_value_objects.dart';

class SignUpForm {
  final EmailAddressValue email;
  final PasswordValue password;

  SignUpForm({required this.password, required this.email});
}