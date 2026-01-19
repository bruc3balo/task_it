import 'package:auth/src/domain/value_objects/app_user_id_value.dart';
import 'package:auth/src/domain/value_objects/display_name_value.dart';
import 'package:auth/src/domain/value_objects/email_address_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role_entity.dart';

part 'app_user_entity.freezed.dart';

@freezed
class AppUserEntity with _$AppUserEntity {

  const factory AppUserEntity({
    required AppUserIdValue id,
    required EmailAddressValue email,
    required DisplayNameValue displayName,
    required UserRoleEntity role,
  }) = _AppUserEntity;

}