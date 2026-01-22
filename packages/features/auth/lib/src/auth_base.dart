// 1. Export your dependencies so the App can see them

export 'package:auth_data/data.dart';
export 'package:auth_domain/domain.dart';
export 'package:auth_presentation/presentation.dart';

import 'package:injectable/injectable.dart';
export 'auth_base.module.dart';


// 2. Use this annotation on a dummy function
@InjectableInit.microPackage()
void initAuthFeatureModule() {}