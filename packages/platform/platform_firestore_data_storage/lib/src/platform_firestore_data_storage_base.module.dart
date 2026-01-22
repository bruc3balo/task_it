//@GeneratedMicroModule;PlatformFirestoreDataStoragePackageModule;package:platform_firestore_data_storage/src/platform_firestore_data_storage_base.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:platform_firestore_data_storage/src/adapter/firestore_app_user_storage.dart'
    as _i639;
import 'package:platform_firestore_data_storage/src/adapter/firestore_task_board_storage.dart'
    as _i240;

class PlatformFirestoreDataStoragePackageModule
    extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i494.TaskBoardDataSource>(
        () => _i240.FirestoreTaskBoardStorage());
    gh.lazySingleton<_i494.AppUserDataSource>(
        () => _i639.FirestoreAppUserDataStore());
  }
}
