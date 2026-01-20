
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth_domain/src/value_objects/_value_objects.dart';

part 'app_user_entity.freezed.dart';

@freezed
class AppUserEntity with _$AppUserEntity {

  const factory AppUserEntity({
    required AppUserIdValue id,
    required EmailAddressValue email,
    required DisplayNameValue displayName,
  }) = _AppUserEntity;

}