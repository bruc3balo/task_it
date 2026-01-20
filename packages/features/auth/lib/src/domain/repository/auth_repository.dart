import 'package:auth/src/domain/entities/app_user_entity.dart';
import 'package:auth/src/domain/forms/create_new_account_form.dart';
import 'package:auth/src/domain/forms/create_new_user_form.dart';
import 'package:auth/src/domain/forms/login_form.dart';
import 'package:auth/src/domain/value_objects/app_user_id_value.dart';
import 'package:auth/src/domain/value_objects/email_address_value.dart';
import 'package:base/base.dart';

abstract class AuthRepository {
  Future<TaskResult<AppUserIdValue>> createAccount(CreateNewAccountForm form);
  Future<TaskResult<AppUserIdValue>> loginToAccount(LoginForm form);
  Future<TaskResult<void>> forgotPassword(EmailAddressValue email);
}