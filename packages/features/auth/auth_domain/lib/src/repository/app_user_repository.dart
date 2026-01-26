import 'package:base/base.dart';
import 'package:core/core.dart';

abstract class AppUserRepository {
  Future<TaskResult<AppUserEntity>> createUser(CreateUserAccountForm user);

  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id);
}
