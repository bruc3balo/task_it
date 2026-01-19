
import 'package:auth/src/domain/entities/app_user_entity.dart';
import 'package:auth/src/domain/forms/create_new_user_form.dart';
import 'package:auth/src/domain/value_objects/app_user_id_value.dart';
import 'package:base/base.dart';

abstract class AppUserRepository {
  Future<TaskResult<AppUserEntity>> createNewUser(CreateNewUserForm form);
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id);
}