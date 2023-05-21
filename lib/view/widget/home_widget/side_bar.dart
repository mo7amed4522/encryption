import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/controller/home_controller/home_screen_controller.dart';
import 'package:encryption/core/util/utiles.dart';
import 'package:encryption/model/mune.dart';
import 'package:encryption/view/widget/home_widget/info_card.dart';
import 'package:encryption/view/widget/home_widget/side_menu.dart';

class SideBar extends GetView<HomeScreenControllerIMP> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Khaled",
                bio: "Mohamed Abdo",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 50, bottom: 50),
                child: Text(
                  "algorithms".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: controller.selectedSideMenu,
                        press: () {
                          RiveUtils.chnageSMIBoolState(menu.rive.status!);
                          controller.changeMune(menu);
                        },
                        riveOnInit: (artboard) {
                          menu.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: menu.rive.stateMachineName);
                        },
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
