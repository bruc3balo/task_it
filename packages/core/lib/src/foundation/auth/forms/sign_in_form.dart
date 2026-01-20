import 'package:core/src/foundation/auth/value_objects/email_address_value.dart';

class SignInForm {
  final EmailAddressValue email;
  final String password;

  SignInForm({required this.password, required this.email});
}
