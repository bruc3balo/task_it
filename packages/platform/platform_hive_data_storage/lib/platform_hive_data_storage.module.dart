//@GeneratedMicroModule;PlatformHiveDataStoragePackageModule;package:platform_hive_data_storage/platform_hive_data_storage.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data_storage/data_storage.dart' as _i688;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:platform_hive_data_storage/src/adapter/hive_local_database_service.dart'
    as _i319;
import 'package:platform_hive_data_storage/src/di/hive_encryption_module.dart'
    as _i598;

class PlatformHiveDataStoragePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final hiveEncryptionModule = _$HiveEncryptionModule();
    await gh.lazySingletonAsync<_i979.HiveAesCipher>(
      () => hiveEncryptionModule.provideHiveAesCipher(),
      preResolve: true,
    );
    gh.lazySingleton<_i688.LocalDatabaseService>(() =>
        _i319.HiveLocalDatabaseService(cipher: gh<_i979.HiveAesCipher>()));
  }
}

class _$HiveEncryptionModule extends _i598.HiveEncryptionModule {}
