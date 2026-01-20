import 'package:auth_domain/src/value_objects/_value_objects.dart';

class CreateAccountForm {
  final DisplayNameValue displayName;
  final EmailAddressValue email;
  final PasswordValue password;

  CreateAccountForm({required this.displayName, required this.email, required this.password});
}