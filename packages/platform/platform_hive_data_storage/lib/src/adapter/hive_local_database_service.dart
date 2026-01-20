import 'package:app_log/app_log.dart';
import 'package:base/base.dart';
import 'package:data_storage/data_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalDatabaseService)
final class HiveLocalDatabaseService implements LocalDatabaseService {
  final HiveAesCipher _cipher;
  final Set<String> _openedBoxes = {};

  HiveLocalDatabaseService({required HiveAesCipher cipher}) : _cipher = cipher;

  Future<TaskResult<Box<T>>> _openBox<T>(String name) async {
    try {
      if (Hive.isBoxOpen(name)) return SuccessResult(result: Hive.box<T>(name));
      final newOpenedBox = await Hive.openBox<T>(name, encryptionCipher: _cipher);
      _openedBoxes.add(name);
      AppLog.I.d(LogTag.database, "Opening box $name");
      return SuccessResult(result: newOpenedBox);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), trace: trace, failureType: FailureType.database));
    }
  }

  @override
  Future<TaskResult<bool>> contains<T>(String key) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          final result = box.containsKey(key);
          AppLog.I.d(LogTag.database, "Checking if box ${box.name} contains $key");
          return SuccessResult(result: result);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<void>> delete<T>(String key) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          AppLog.I.d(LogTag.database, "Deleting box ${box.name} for key $key");

          T? result = box.get(key);
          if (result == null) return FailedResult(AppFailure(message: "$key not found from ${box.name}", failureType: FailureType.notFound));

          await box.delete(key);
          return SuccessResult(result: null);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<T>> get<T>(String key) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          AppLog.I.d(LogTag.database, "Getting key $key for box ${box.name}");

          T? result = box.get(key);
          if (result == null) return FailedResult(AppFailure(message: "$key not found from ${box.name}", failureType: FailureType.notFound));

          return SuccessResult(result: result);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<CollectionId>> set<T>(CollectionId? key, T value) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;

          AppLog.I.d(LogTag.database, "Setting value for key $key in box ${box.name}");

          if (key == null) {
            final collectionId = await box.add(value);
            return SuccessResult(result: collectionId.toString());
          }

          await box.put(key, value);
          return SuccessResult(result: key);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<void>> clearAllData() async {
    try {
      AppLog.I.d(LogTag.database, "Clearing all result in all boxes");
      AppLog.I.d(LogTag.database, "Closing all result in boxes $_openedBoxes");

      // Close open boxes
      await Future.wait(_openedBoxes.where(Hive.isBoxOpen).map((boxName) async => await Hive.box(boxName).close()));
      _openedBoxes.clear();

      // Delete all result
      await Hive.deleteFromDisk();
      return SuccessResult(result: null);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  // KV box methods
  @override
  Future<TaskResult<dynamic>> getKv(String key) async => get<dynamic>(key);

  @override
  Future<TaskResult<CollectionId>> setKv(CollectionId key, dynamic value) async => set<dynamic>(key, value);

  @override
  Future<TaskResult<List<T>>> getAll<T>() async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          AppLog.I.d(LogTag.database, "Getting all ${box.length} objects in ${box.name}");
          var result = box.values.whereType<T>().toList();
          return SuccessResult(result: result);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<List<T>>> getPaged<T>({required int page, required int pageSize}) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          AppLog.I.d(LogTag.database, "Fetching page $page with pageSize $pageSize in ${box.name}");
          var keys = box.keys.skip(page * pageSize).take(pageSize);
          var result = keys.map((key) => box.get(key)).whereType<T>().toList(growable: false);
          AppLog.I.d(LogTag.database, "Found ${result.length} items in ${box.name}");
          return SuccessResult(result: result);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<Map<CollectionId, T>>> setMany<T>(CollectionId Function(T)? key, List<T> values) async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          AppLog.I.d(LogTag.database, "Saving ${values.length} objects in ${box.name}");
          var result = <CollectionId, T>{};
          await Future.wait(
            values.map((value) async {
              if (key == null) {
                final itemKey = await box.add(value);
                result.putIfAbsent(itemKey.toString(), () => value);
                return;
              }

              final CollectionId itemKey = key(value);
              await box.put(itemKey, value);
              result.putIfAbsent(itemKey, () => value);
            }),
          );

          return SuccessResult(result: result);
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<int>> clear<T>() async {
    try {
      final boxOpenResult = await _openBox<T>(T.toString());
      switch (boxOpenResult) {
        case SuccessResult<Box<T>>():
          var box = boxOpenResult.result;
          int deletedItems = await box.clear();
          AppLog.I.d(LogTag.database, "Clearing all result in box ${box.name}");
          return SuccessResult(result: deletedItems, message: "Cleared $deletedItems");
        case FailedResult<Box<T>>():
          return FailedResult.fromFailure(boxOpenResult);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
