import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_firebase_authentication/platform_firebase_authentication.dart';
import 'package:platform_firestore_data_storage/platform_firestore_data_storage.dart';
import 'package:platform_hive_data_storage/platform_hive_data_storage.dart';
import 'package:platform_internet_checker_connectivity/platform_connectivity.dart';
import 'package:taskmanager_task_board/taskmanager_task_board.dart';
import 'di.config.dart'; // Generated file

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(AuthPackageModule), // From features
    ExternalModule(TaskmanagerTaskBoardPackageModule), // From features
    ExternalModule(PlatformFirebaseAuthenticationPackageModule), // From platform
    ExternalModule(PlatformFirestoreDataStoragePackageModule), // From platform
    ExternalModule(PlatformHiveDataStoragePackageModule), // From platform
    ExternalModule(PlatformInternetCheckerConnectivityPackageModule), // From platform
  ],
)
Future<void> configureDependencies() async => await getIt.init();