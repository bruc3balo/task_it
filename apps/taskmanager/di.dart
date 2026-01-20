/*
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:niwekee/constants.dart';
import 'package:niwekee/core/data_storage/src/utils/hive_cypher_generator.dart';

import 'package:path_provider/path_provider.dart';

export 'src/service/local_database_service.dart';

@module
abstract class StorageModule {


  @preResolve
  Future<HiveAesCipher> hiveCipher() async => await HiveKeyGenerator.obtainHiveAesCipher();


  @preResolve
  Future<HiveInterface> provideHive() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = dir.uri.resolve(appName).resolve("db").toFilePath();
    await Hive.initFlutter(path);
    return Hive;
  }

}
*/
