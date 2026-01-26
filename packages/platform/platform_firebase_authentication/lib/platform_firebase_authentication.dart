library;

import 'package:injectable/injectable.dart';

export 'src/platform_firebase_authentication_base.dart';
export 'platform_firebase_authentication.module.dart';

@InjectableInit.microPackage()
void initPlatformFirebaseAuthentication() {}