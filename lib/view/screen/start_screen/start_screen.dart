import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:encryption/controller/start_controller/start_screen_controller.dart';
import 'package:encryption/core/constant/app_photo.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenControllerIMP>(
      init: StartScreenControllerIMP(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xFF17203A),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Lottie.asset(
            AppPhotoLink.startup,
          ),
        ),
      ),
    );
  }
}
