import 'package:base/base.dart';
import 'package:data_storage/data_storage.dart';

abstract class LocalDatabaseService {

  // Key-Value
  Future<TaskResult<CollectionId>> setKv(CollectionId key, dynamic value);
  Future<TaskResult<dynamic>> getKv(CollectionId key);

  // Collection
  Future<TaskResult<CollectionId>> set<T>(CollectionId? key, T value);
  Future<TaskResult<Map<CollectionId, T>>> setMany<T>(CollectionId Function(T)? key, List<T> values);
  Future<TaskResult<T>> get<T>(CollectionId key);
  Future<TaskResult<List<T>>> getAll<T>();
  Future<TaskResult<List<T>>> getPaged<T>({required int page, required int pageSize});
  Future<TaskResult<void>> delete<T>(CollectionId key);
  Future<TaskResult<bool>> contains<T>(CollectionId key);
  Future<TaskResult<int>> clear<T>();

  //Clear whole database
  Future<TaskResult<void>> clearAllData();
}