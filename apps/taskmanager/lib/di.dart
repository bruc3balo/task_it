import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // Generated file

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(AuthFeatureModule), // From features
    // ExternalModule(TaskFeaturePackageModule), // From features
  ],
)
void configureDependencies() => getIt.init();