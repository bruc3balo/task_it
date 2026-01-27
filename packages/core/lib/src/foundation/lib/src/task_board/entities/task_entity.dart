import 'package:foundation/src/task_board/value_objects/_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_status_entity.dart';

part 'task_entity.freezed.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required TaskTitleValue title,
    required TaskDescriptionValue description,
    required DateTime createdAt,
    required DateTime? dueAt,
    @Default(TaskStatusEntity.pending) TaskStatusEntity status,
    required TaskManagerIdValue managerId, // The Manager
    AssigneeIdValue? assigneeUserId, // The Doer (Nullable: might not be assigned yet)
  }) = _TaskEntity;
}
