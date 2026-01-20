import 'package:auth_domain/src/entities/_entities.dart';
import 'package:auth_domain/src/forms/_forms.dart';
import 'package:auth_domain/src/value_objects/_value_objects.dart';
import 'package:base/base.dart';

abstract class AppUserRepository {
  Future<TaskResult<AppUserEntity>> createUser(CreateAccountForm form);
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id);
}