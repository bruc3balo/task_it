import 'package:auth/src/domain/entities/user_role_entity.dart';
import 'package:auth/src/domain/value_objects/display_name_value.dart';
import 'package:auth/src/domain/value_objects/email_address_value.dart';

class CreateNewAccountForm {
  final EmailAddressValue email;
  final String password;

  CreateNewAccountForm({required this.password, required this.email});
}
