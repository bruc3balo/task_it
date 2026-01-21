// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDocument _$TaskDocumentFromJson(Map<String, dynamic> json) => TaskDocument(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: json['created_at'] as String,
  dueAt: json['due_at'] as String,
  status: json['status'] as String,
  managerId: json['manager_id'] as String,
  assigneeUserId: json['assignee_user_id'] as String?,
);

Map<String, dynamic> _$TaskDocumentToJson(TaskDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
      'due_at': instance.dueAt,
      'status': instance.status,
      'manager_id': instance.managerId,
      'assignee_user_id': instance.assigneeUserId,
    };
