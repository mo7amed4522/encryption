import 'package:get/get.dart';
import 'package:encryption/core/constant/curd.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
