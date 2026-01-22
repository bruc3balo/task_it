export 'package:taskmanager_taskboard_presentation/presentation.dart';
export 'package:taskmanger_taskboard_domain/domain.dart';
export 'package:taskmanager_task_board_data/data.dart';

// 1. Export your dependencies so the App can see them

import 'package:injectable/injectable.dart';
export 'taskmanager_task_board_base.module.dart';


@InjectableInit.microPackage()
void initTaskManagerTaskBoardFeatureModule() {}