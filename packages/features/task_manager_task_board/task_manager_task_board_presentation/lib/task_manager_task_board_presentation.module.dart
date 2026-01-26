//@GeneratedMicroModule;TaskManagerTaskBoardPresentationPackageModule;package:task_manager_task_board_presentation/task_manager_task_board_presentation.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart'
    as _i339;
import 'package:task_manager_task_board_presentation/features/create_task/create_task_bloc.dart'
    as _i668;
import 'package:task_manager_task_board_presentation/features/view_my_created_tasks/view_my_created_tasks_bloc.dart'
    as _i560;

class TaskManagerTaskBoardPresentationPackageModule
    extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i668.CreateTaskBloc>(
        () => _i668.CreateTaskBloc(gh<_i339.CreateANewTaskUseCase>()));
    gh.factory<_i560.ViewMyCreatedTasksBloc>(() => _i560.ViewMyCreatedTasksBloc(
        gh<_i339.GetTasksCreatedByUserUseCase<dynamic>>()));
  }
}
