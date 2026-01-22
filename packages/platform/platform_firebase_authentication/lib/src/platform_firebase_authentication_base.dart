export 'package:platform_firebase_authentication/platform_firebase_authentication.dart';

import 'package:injectable/injectable.dart';
export 'platform_firebase_authentication_base.module.dart';


// 2. Use this annotation on a dummy function
@InjectableInit.microPackage()
void initFirebaseAuthenticationPlatform() {}