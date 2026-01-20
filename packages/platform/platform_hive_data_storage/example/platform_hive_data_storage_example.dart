import 'package:data_storage/data_storage.dart';

void saveData(LocalDatabaseService database) {

  database.setKv("id", 0);
  database.getKv("id");


  database.set("0", 1);
  database.set("0", true);
}
