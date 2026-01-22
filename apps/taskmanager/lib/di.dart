import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:taskmanager_task_board/taskmanager_task_board.dart';
import 'di.config.dart'; // Generated file

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(AuthPackageModule), // From features
    ExternalModule(TaskmanagerTaskBoardPackageModule), // From features
  ],
)
Future<void> configureDependencies() async => await getIt.init();