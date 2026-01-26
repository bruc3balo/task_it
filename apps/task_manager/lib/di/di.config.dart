// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_data/auth_data.dart' as _i1005;
import 'package:auth_domain/auth_domain.module.dart' as _i156;
import 'package:auth_presentation/auth_presentation.module.dart' as _i164;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:platform_firebase_authentication/platform_firebase_authentication.dart'
    as _i337;
import 'package:platform_firestore_data_storage/platform_firestore_data_storage.dart'
    as _i433;
import 'package:platform_hive_data_storage/platform_hive_data_storage.dart'
    as _i328;
import 'package:platform_internet_checker_connectivity/platform_connectivity.dart'
    as _i375;
import 'package:task_manager_task_board_data/task_manager_task_board_data.dart'
    as _i1000;
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart'
    as _i339;
import 'package:task_manager_task_board_presentation/task_manager_task_board_presentation.dart'
    as _i676;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i156.AuthDomainPackageModule().init(gh);
    await _i1005.AuthDataPackageModule().init(gh);
    await _i164.AuthPresentationPackageModule().init(gh);
    await _i339.TaskManagerTaskBoardDomainPackageModule().init(gh);
    await _i1000.TaskManagerTaskBoardDataPackageModule().init(gh);
    await _i676.TaskManagerTaskBoardPresentationPackageModule().init(gh);
    await _i337.PlatformFirebaseAuthenticationPackageModule().init(gh);
    await _i433.PlatformFirestoreDataStoragePackageModule().init(gh);
    await _i328.PlatformHiveDataStoragePackageModule().init(gh);
    await _i375.PlatformInternetCheckerConnectivityPackageModule().init(gh);
    return this;
  }
}
