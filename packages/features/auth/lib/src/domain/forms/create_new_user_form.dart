import 'package:auth/src/domain/entities/user_role_entity.dart';
import 'package:auth/src/domain/value_objects/display_name_value.dart';
import 'package:auth/src/domain/value_objects/email_address_value.dart';

class CreateNewUserForm {
  final DisplayNameValue displayName;
  final EmailAddressValue email;
  final String password;
  final UserRoleEntity role;

  CreateNewUserForm({required this.displayName, required this.email, required this.role, required this.password});
}