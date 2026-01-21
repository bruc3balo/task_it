import 'package:foundation/src/auth/value_objects/app_user_id_value.dart';
import 'package:foundation/src/auth/value_objects/display_name_value.dart';
import 'package:foundation/src/auth/value_objects/email_address_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_entity.freezed.dart';

@freezed
class AppUserEntity with _$AppUserEntity {

  const factory AppUserEntity({
    required AppUserIdValue id,
    required EmailAddressValue email,
    required DisplayNameValue displayName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AppUserEntity;

}