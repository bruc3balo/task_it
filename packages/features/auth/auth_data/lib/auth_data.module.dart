//@GeneratedMicroModule;AuthDataPackageModule;package:auth_data/auth_data.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_data/src/repository_impl/app_user_repository_impl.dart'
    as _i430;
import 'package:auth_data/src/repository_impl/auth_repository_impl.dart'
    as _i978;
import 'package:auth_domain/auth_domain.dart' as _i470;
import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class AuthDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i470.AppUserRepository>(() => _i430.AppUserRepositoryImpl(
        appUserDataSource: gh<_i494.AppUserDataSource>()));
    gh.lazySingleton<_i470.AuthRepository>(() => _i978.AuthRepositoryImpl(
        authenticatorService: gh<_i494.AppAuthenticatorService>()));
  }
}
