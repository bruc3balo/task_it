//@GeneratedMicroModule;TaskmanagerTaskBoardPackageModule;package:taskmanager_task_board/src/taskmanager_task_board_base.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:taskmanager_task_board/src/data/lib/src/repository/task_manager_repository_impl.dart'
    as _i685;
import 'package:taskmanager_task_board/src/presentation/lib/view_models/create_task/create_task_bloc.dart'
    as _i985;
import 'package:taskmanager_task_board/src/presentation/lib/view_models/view_my_created_tasks/view_my_created_tasks_bloc.dart'
    as _i22;
import 'package:taskmanger_taskboard_domain/domain.dart' as _i492;

class TaskmanagerTaskBoardPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i22.ViewMyCreatedTasksBloc>(() => _i22.ViewMyCreatedTasksBloc(
        gh<_i492.GetTasksCreatedByUserUseCase<dynamic>>()));
    gh.lazySingleton<_i492.TaskManagerRepository>(() =>
        _i685.TaskManagerRepositoryImpl(
            dataSource: gh<_i492.TaskBoardDataSource>()));
    gh.factory<_i985.CreateTaskBloc>(
        () => _i985.CreateTaskBloc(gh<_i492.CreateANewTaskUseCase>()));
  }
}
