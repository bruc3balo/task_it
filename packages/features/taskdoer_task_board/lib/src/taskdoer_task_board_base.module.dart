//@GeneratedMicroModule;TaskdoerTaskBoardPackageModule;package:taskdoer_task_board/src/taskdoer_task_board_base.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:taskdoer_task_board/src/data/lib/src/repository/task_doer_repository_impl.dart'
    as _i1031;
import 'package:taskdoer_task_board/src/presentation/lib/pages/view_my_assigned_tasks/view_my_assigned_tasks_bloc.dart'
    as _i384;
import 'package:taskdoer_task_board_domain/domain.dart' as _i791;

class TaskdoerTaskBoardPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i791.TaskDoerRepository>(() =>
        _i1031.TaskDoerRepositoryImpl(
            dataSource: gh<_i791.TaskBoardDataSource>()));
    gh.factory<_i384.ViewMyAssignedTasksBloc>(() =>
        _i384.ViewMyAssignedTasksBloc(
            gh<_i791.GetTasksAssignedToUserUseCase<dynamic>>()));
  }
}
