import 'package:injectable/injectable.dart';
export 'features/_features.dart';

export 'auth_presentation.module.dart';

@InjectableInit.microPackage()
void initAuthPresentationModule() {}