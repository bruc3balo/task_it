import 'package:auth_data/auth_data.dart';
import 'package:auth_domain/auth_domain.module.dart';
import 'package:auth_presentation/auth_presentation.module.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:platform_firebase_authentication/platform_firebase_authentication.dart';
import 'package:platform_firestore_data_storage/platform_firestore_data_storage.dart';
import 'package:platform_hive_data_storage/platform_hive_data_storage.dart';
import 'package:platform_internet_checker_connectivity/platform_connectivity.dart';
import 'package:task_manager_task_board_data/task_manager_task_board_data.dart';
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart';
import 'package:task_manager_task_board_presentation/task_manager_task_board_presentation.dart';
import 'di.config.dart'; // Generated file


@InjectableInit(
  externalPackageModulesBefore: [
    ///Features
    //Auth
    ExternalModule(AuthDomainPackageModule),
    ExternalModule(AuthDataPackageModule),
    ExternalModule(AuthPresentationPackageModule),

    //Task Manager
    ExternalModule(TaskManagerTaskBoardDomainPackageModule),
    ExternalModule(TaskManagerTaskBoardDataPackageModule),
    ExternalModule(TaskManagerTaskBoardPresentationPackageModule),

    ///Platforms
    ExternalModule(PlatformFirebaseAuthenticationPackageModule), // From platform
    ExternalModule(PlatformFirestoreDataStoragePackageModule), // From platform
    ExternalModule(PlatformHiveDataStoragePackageModule), // From platform
    ExternalModule(PlatformInternetCheckerConnectivityPackageModule), // From platform
  ],
)
Future<void> configureDependencies() async => await GetIt.I.init();