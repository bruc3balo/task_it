//@GeneratedMicroModule;PlatformFirebaseAuthenticationPackageModule;package:platform_firebase_authentication/src/platform_firebase_authentication_base.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:platform_firebase_authentication/src/adapter/firebase_authentication_service.dart'
    as _i126;

class PlatformFirebaseAuthenticationPackageModule
    extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i494.AppAuthenticatorService>(
        () => _i126.FirebaseAuthenticationService());
  }
}
