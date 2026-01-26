//@GeneratedMicroModule;TaskManagerTaskBoardDataPackageModule;package:task_manager_task_board_data/task_manager_task_board_data.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:task_manager_task_board_data/src/repository/task_manager_repository_impl.dart'
    as _i422;
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart'
    as _i339;

class TaskManagerTaskBoardDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i339.TaskManagerRepository>(() =>
        _i422.TaskManagerRepositoryImpl(
            dataSource: gh<_i339.TaskBoardDataSource>()));
  }
}
