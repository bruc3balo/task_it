library;

import 'package:injectable/injectable.dart';

export 'src/auth_data_base.dart';
export 'auth_data.module.dart';

@InjectableInit.microPackage()
void initAuthDataModule() {}