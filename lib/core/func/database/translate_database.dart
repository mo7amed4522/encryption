import 'package:get/get.dart';
import 'package:encryption/core/server/my_server.dart';

translateDataBase(columnar, columnen) {
  MyServices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "AR") {
    return columnar;
  } else {
    return columnen;
  }
}
