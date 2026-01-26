import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveEncryptionModule {
  @preResolve
  @LazySingleton()
  Future<HiveAesCipher> provideHiveAesCipher() async {
    const secureStorage = FlutterSecureStorage();
    const encryptionKeyKey = 'hive_encryption_key';
    
    String? base64Key = await secureStorage.read(key: encryptionKeyKey);
    if (base64Key != null) {
      final key = base64.decode(base64Key);
      return HiveAesCipher(key);
    }

    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: encryptionKeyKey,
      value: base64.encode(key),
    );
    return HiveAesCipher(key);
  }
}
