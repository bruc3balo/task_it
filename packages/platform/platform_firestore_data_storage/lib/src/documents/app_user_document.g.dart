// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserDocument _$AppUserDocumentFromJson(Map<String, dynamic> json) =>
    AppUserDocument(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['display_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AppUserDocumentToJson(AppUserDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.displayName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
