import 'package:injectable/injectable.dart';

export 'adapter/hive_local_database_service.dart';

export 'platform_hive_data_storage_base.module.dart';

// 2. Use this annotation on a dummy function
@InjectableInit.microPackage()
void initHiveDataStorageModule() {}