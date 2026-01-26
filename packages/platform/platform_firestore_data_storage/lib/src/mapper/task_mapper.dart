import 'package:core/core.dart';
import 'package:platform_firestore_data_storage/src/documents/task_document.dart';
import 'package:platform_firestore_data_storage/src/utils/document_entity_mapper.dart';

class TaskDocumentEntityMapper extends DocumentEntityMapper<TaskEntity, TaskDocument> {
  @override
  TaskDocument toDocument(TaskEntity entity) {
    return TaskDocument(
      id: entity.id,
      title: entity.title.value,
      description: entity.description.value,
      createdAt: entity.createdAt.toIso8601String(),
      dueAt: entity.dueAt?.toIso8601String(),
      status: entity.status.name,
      managerId: entity.managerId.value,
      assigneeUserId: entity.assigneeUserId?.value,
    );
  }

  @override
  TaskEntity toEntity(TaskDocument document) {
    return TaskEntity(
      id: document.id,
      title: TaskTitleValue(document.title),
      description: TaskDescriptionValue(document.description),
      createdAt: DateTime.parse(document.createdAt),
      dueAt: document.dueAt != null ? DateTime.parse(document.dueAt!) : null,
      status: TaskStatusEntity.values.byName(document.status),
      managerId: task_managerIdValue(document.managerId),
      assigneeUserId: document.assigneeUserId != null ? AssigneeIdValue(document.assigneeUserId!) : null,
    );
  }
}
