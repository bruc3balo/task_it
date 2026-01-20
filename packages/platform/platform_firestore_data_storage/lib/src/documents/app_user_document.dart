import 'package:json_annotation/json_annotation.dart';

part 'app_user_document.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: true,
)
class AppUserDocument {
  final String id;
  final String email;
  final String displayName;
  final DateTime createdAt;
  final DateTime updatedAt;

  AppUserDocument({
    required this.id,
    required this.email,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppUserDocument.fromJson(Map<String, dynamic> json) =>
      _$AppUserDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserDocumentToJson(this);
}
