import 'dart:async';

import 'package:get/get.dart';
import 'package:encryption/core/routes/router.dart';

abstract class StartScreenController extends GetxController {}

class StartScreenControllerIMP extends StartScreenController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.home);
    });
    super.onInit();
  }
}
