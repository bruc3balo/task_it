export 'package:taskdoer_task_board_domain/domain.dart';
export 'package:taskdoer_task_board_data/data.dart';
export 'package:taskdoer_task_board_presentation/presentation.dart';

// 1. Export your dependencies so the App can see them

import 'package:injectable/injectable.dart';
export 'taskdoer_task_board_base.module.dart';


@InjectableInit.microPackage()
void initTaskDoerTaskBoardFeatureModule() {}