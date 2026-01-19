
import 'package:base_task_board/src/domain/value_objects/assignee_id_value.dart';
import 'package:base_task_board/src/domain/value_objects/task_description_value.dart';
import 'package:base_task_board/src/domain/value_objects/task_manager_id_value.dart';
import 'package:base_task_board/src/domain/value_objects/task_title_value.dart';
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
    required DateTime dueAt,
    @Default(TaskStatusEntity.pending) TaskStatusEntity status,
    required TaskManagerIdValue managerId, // The Manager
    AssigneeIdValue? assigneeUserId, // The Doer (Nullable: might not be assigned yet)
  }) = _TaskEntity;
}
