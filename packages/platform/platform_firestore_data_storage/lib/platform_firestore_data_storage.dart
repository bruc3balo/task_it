library;

import 'package:injectable/injectable.dart';

export 'src/platform_firestore_data_storage_base.dart';
export 'platform_firestore_data_storage.module.dart';

@InjectableInit.microPackage()
void initPlatformFirestoreDataStorage() {}