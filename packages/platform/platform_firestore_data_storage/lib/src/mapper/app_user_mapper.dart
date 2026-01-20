import 'package:core/core.dart';
import 'package:platform_firestore_data_storage/src/documents/app_user_document.dart';
import 'package:platform_firestore_data_storage/src/utils/document_entity_mapper.dart';

class AppUserMapper extends DocumentEntityMapper<AppUserEntity, AppUserDocument> {

  @override
  AppUserDocument toDocument(AppUserEntity entity) => AppUserDocument(
    id: entity.id.value,
    email: entity.email.value,
    displayName: entity.displayName.value,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  );

  @override
  AppUserEntity toEntity(AppUserDocument document) => AppUserEntity(
    id: AppUserIdValue(document.id),
    email: EmailAddressValue(document.email),
    displayName: DisplayNameValue(document.displayName),
    createdAt: document.createdAt,
    updatedAt: document.updatedAt,
  );

}
