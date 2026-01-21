import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart'; // Assumes Result, Failure, TaskEntity exist here
import 'package:injectable/injectable.dart';
import 'package:platform_firestore_data_storage/src/documents/task_document.dart';
import 'package:platform_firestore_data_storage/src/mapper/task_mapper.dart';
import 'package:platform_firestore_data_storage/src/utils/handle_firestore_exception.dart';

@LazySingleton(as: TaskBoardDataSource)
class FirestoreTaskBoardStorage extends TaskBoardDataSource {
  late final CollectionReference<TaskDocument> _taskCollection = FirebaseFirestore.instance
      .collection("task_board")
      .withConverter<TaskDocument>(fromFirestore: (snap, _) => TaskDocument.fromJson(snap.data()!), toFirestore: (model, _) => model.toJson());

  final TaskDocumentEntityMapper _mapper = TaskDocumentEntityMapper();

  @override
  Future<TaskResult<List<TaskEntity>>> getTasksAssignedToUser<Page>(AssigneeIdValue assigneeId, BasePage<Page> page) async {
    try {
      // 1. Base Query
      // We MUST order by the field we use for the cursor (createdAt)
      Query<TaskDocument> query = _taskCollection
          .where('assignee_id', isEqualTo: assigneeId.value)
          .orderBy('created_at', descending: true)
          .limit(page.pageSize);

      // 2. Apply Cursor (Pagination)
      // We assume 'Page' is the last 'TaskEntity' loaded.
      final cursor = page.page;
      if (cursor is TaskEntity) {
        // We start after the createdAt of the last item.
        // We typically include the ID as a secondary sort key to handle exact timestamp collisions.
        query = query.startAfter([cursor.createdAt, cursor.id]);
      }

      // 3. Execute
      final snapshot = await query.get();

      // 4. Map
      final tasks = snapshot.docs.map((doc) => _mapper.toEntity(doc.data())).toList();

      return SuccessResult(result: tasks, message: "${tasks.length} tasks found");
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }

  @override
  Future<TaskResult<List<TaskEntity>>> getTasksCreatedByUser<Page>(TaskManagerIdValue taskManagerId, BasePage<Page> page) async {
    try {
      Query<TaskDocument> query = _taskCollection
          .where('manager_id', isEqualTo: taskManagerId.value)
          .orderBy('created_at', descending: true)
          .limit(page.pageSize);

      final cursor = page.page;
      if (cursor is TaskEntity) query = query.startAfter([cursor.createdAt, cursor.id]);

      final snapshot = await query.get();
      final tasks = snapshot.docs.map((doc) => _mapper.toEntity(doc.data())).toList();

      return SuccessResult(result: tasks);
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }

  @override
  Future<TaskResult<TaskEntity>> saveTask(TaskEntity task) async {
    try {
      // Logic for Upsert (Update if exists, Insert if new)
      await _taskCollection.doc(task.id).set(_mapper.toDocument(task));
      return SuccessResult(result: task);
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }
}
