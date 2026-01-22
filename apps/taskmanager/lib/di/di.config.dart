// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/auth.dart' as _i662;
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
import 'package:taskmanager/presentation/view_models/auth/auth_bloc.dart'
    as _i269;
import 'package:taskmanager_task_board/taskmanager_task_board.dart' as _i243;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i662.AuthPackageModule().init(gh);
    await _i243.TaskmanagerTaskBoardPackageModule().init(gh);
    await _i337.PlatformFirebaseAuthenticationPackageModule().init(gh);
    await _i433.PlatformFirestoreDataStoragePackageModule().init(gh);
    await _i328.PlatformHiveDataStoragePackageModule().init(gh);
    await _i375.PlatformInternetCheckerConnectivityPackageModule().init(gh);
    gh.factory<_i269.AuthBloc>(
      () => _i269.AuthBloc(gh<_i243.AppAuthenticatorService>()),
    );
    return this;
  }
}
