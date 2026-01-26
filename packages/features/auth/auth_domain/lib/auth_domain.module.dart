//@GeneratedMicroModule;AuthDomainPackageModule;package:auth_domain/auth_domain.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_domain/auth_domain.dart' as _i470;
import 'package:auth_domain/src/use_case/create_user_use_case.dart' as _i984;
import 'package:auth_domain/src/use_case/get_current_user_use_case.dart'
    as _i570;
import 'package:auth_domain/src/use_case/initiate_forgot_password_use_case.dart'
    as _i177;
import 'package:auth_domain/src/use_case/sign_in_use_case.dart' as _i157;
import 'package:auth_domain/src/use_case/sign_up_use_case.dart' as _i987;
import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class AuthDomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i984.CreateUserUseCase>(() => _i984.CreateUserUseCase(
          appUserRepository: gh<_i470.AppUserRepository>(),
          authenticatorService: gh<_i494.AppAuthenticatorService>(),
        ));
    gh.lazySingleton<_i570.GetCurrentUserUseCase>(
        () => _i570.GetCurrentUserUseCase(
              appUserRepository: gh<_i470.AppUserRepository>(),
              authenticatorService: gh<_i494.AppAuthenticatorService>(),
            ));
    gh.lazySingleton<_i987.SignUpUseCase>(
        () => _i987.SignUpUseCase(authRepository: gh<_i470.AuthRepository>()));
    gh.lazySingleton<_i177.InitiateForgotPasswordUseCase>(() =>
        _i177.InitiateForgotPasswordUseCase(
            authRepository: gh<_i470.AuthRepository>()));
    gh.lazySingleton<_i157.SignInUseCase>(() => _i157.SignInUseCase(
          authRepository: gh<_i470.AuthRepository>(),
          appUserRepository: gh<_i470.AppUserRepository>(),
        ));
  }
}
