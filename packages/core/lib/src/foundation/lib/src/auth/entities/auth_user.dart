import 'package:foundation/src/auth/value_objects/_value_objects.dart';

class AuthUser {
  final AppUserIdValue id;
  final EmailAddressValue emailAddressValue;

  AuthUser({required this.id, required this.emailAddressValue});
}