//@GeneratedMicroModule;TaskManagerTaskBoardDomainPackageModule;package:task_manager_task_board_domain/task_manager_task_board_domain.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task_manager_task_board_domain/src/repository/_repository.dart'
    as _i758;
import 'package:task_manager_task_board_domain/src/use_case/create_a_new_task_use_case.dart'
    as _i395;
import 'package:task_manager_task_board_domain/src/use_case/get_tasks_created_by_user_use_case.dart'
    as _i17;

class TaskManagerTaskBoardDomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i17.GetTasksCreatedByUserUseCase<dynamic>>(
        () => _i17.GetTasksCreatedByUserUseCase<dynamic>(
              taskManagerRepository: gh<_i758.TaskManagerRepository>(),
              appAuthenticatorService: gh<_i494.AppAuthenticatorService>(),
            ));
    gh.lazySingleton<_i395.CreateANewTaskUseCase>(
        () => _i395.CreateANewTaskUseCase(
              task_managerRepository: gh<_i758.TaskManagerRepository>(),
              appAuthenticatorService: gh<_i494.AppAuthenticatorService>(),
            ));
  }
}
