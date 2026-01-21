import 'package:foundation/src/auth/value_objects/_value_objects.dart';
import 'package:foundation/src/auth/entities/_entities.dart';
import 'package:base/base.dart';


abstract class AppUserDataSource {
  Future<TaskResult<AppUserEntity>> saveUser(AppUserEntity user);
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id);
  Future<TaskResult<AppUserEntity>> findUserByEmail(EmailAddressValue email);
}