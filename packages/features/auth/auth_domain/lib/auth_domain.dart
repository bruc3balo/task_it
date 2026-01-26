library;

import 'package:injectable/injectable.dart';

export 'src/domain_base.dart';
export 'auth_domain.module.dart';

@InjectableInit.microPackage()
void initAuthDomainModule() {}