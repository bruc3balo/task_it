import 'package:core/core.dart';

abstract class AppUserDataSource {
  Future<TaskResult<AppUserEntity>> saveUser(AppUserEntity user);
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id);
  Future<TaskResult<AppUserEntity>> findUserByEmail(EmailAddressValue email);
}