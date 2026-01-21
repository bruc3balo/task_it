
import 'package:foundation/src/auth/value_objects/_value_objects.dart';

class CreateUserAccountForm {
  final DisplayNameValue displayName;
  final EmailAddressValue email;
  final AppUserIdValue userId;

  CreateUserAccountForm({required this.displayName, required this.email, required this.userId});
}