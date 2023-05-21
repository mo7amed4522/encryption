// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/controller/home_controller/home_screen_controller.dart';
import 'package:encryption/core/theme/theme_color.dart';
import 'package:encryption/view/widget/home_widget/menu_btn.dart';
import 'package:encryption/view/widget/home_widget/side_bar.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIMP>(
      init: HomeScreenControllerIMP(),
      builder: (controller) => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.back,
        body: Stack(
          children: [
            AnimatedPositioned(
              width: 288,
              height: Get.height,
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: controller.isSideBarOpen ? 0 : -288,
              top: 0,
              child: SideBar(),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(1 * controller.animation.value -
                    30 * (controller.animation.value) * pi / 180),
              child: Transform.translate(
                offset: Offset(controller.animation.value * 265, 0),
                child: Transform.scale(
                  scale: controller.scalAnimation.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    child: controller.Screen[controller.selectedSideMenu.path],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: controller.isSideBarOpen ? 220 : 0,
              top: 16,
              child: MenuBtn(
                press: () {
                  controller.isMenuOpenInput.value =
                      !controller.isMenuOpenInput.value;

                  if (controller.animationController.value == 0) {
                    controller.animationController.forward();
                  } else {
                    controller.animationController.reverse();
                  }
                  controller.changeOpen();
                },
                riveOnInit: (artboard) {
                  final controller1 = StateMachineController.fromArtboard(
                      artboard, "State Machine");

                  artboard.addController(controller1!);

                  controller.isMenuOpenInput =
                      controller1.findInput<bool>("isOpen") as SMIBool;
                  controller.isMenuOpenInput.value = true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
