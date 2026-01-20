import 'package:base/base.dart';

abstract class SecureKeyStore {
  /// Get a secret key by name
  Future<TaskResult<String>> getKey({required String keyName});

  /// Save a secret key
  Future<TaskResult<void>> setKey({required String keyName, required String value});
}
