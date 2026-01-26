library;

export 'src/task_manager_task_board_domain_base.dart';
export 'package:core/core.dart';

import 'package:injectable/injectable.dart';

export 'task_manager_task_board_domain.module.dart';

@InjectableInit.microPackage()
void initTaskMangerTaskBoardDomainModule() {}