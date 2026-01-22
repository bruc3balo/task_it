import 'package:injectable/injectable.dart';
export 'adapter/internet_connection_checker_connection_service.dart';
export 'platform_connectivity.module.dart';

// 2. Use this annotation on a dummy function
@InjectableInit.microPackage()
void initHiveDataStorageModule() {}