library;

import 'package:injectable/injectable.dart';

export 'src/platform_hive_data_storage_base.dart';
export 'src/di/hive_encryption_module.dart';
export 'platform_hive_data_storage.module.dart';

@InjectableInit.microPackage()
void initPlatformHiveDataStorage() {}