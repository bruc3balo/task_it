import 'package:json_annotation/json_annotation.dart';

part 'task_document.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TaskDocument {
  final String id;
  final String title;
  final String description;
  final String createdAt; // ISO-8601
  final String? dueAt;     // ISO-8601
  final String status;    // enum as string
  final String managerId;
  final String? assigneeUserId;

  const TaskDocument({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.dueAt,
    required this.status,
    required this.managerId,
    this.assigneeUserId,
  });

  /// JSON → Document
  factory TaskDocument.fromJson(Map<String, dynamic> json) =>
      _$TaskDocumentFromJson(json);

  /// Document → JSON
  Map<String, dynamic> toJson() => _$TaskDocumentToJson(this);
}
