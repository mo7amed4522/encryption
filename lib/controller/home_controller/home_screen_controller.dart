// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/core/constant/dio_helper.dart';
import 'package:encryption/core/theme/theme_color.dart';
import 'package:encryption/model/caser_moduel.dart';
import 'package:encryption/model/mune.dart';
import 'package:encryption/view/screen/home/screen_widget/caesar_cipher_screen.dart';
import 'package:encryption/view/screen/home/screen_widget/des_scree_widget.dart';
import 'package:encryption/view/screen/home/screen_widget/transposition_cipher_screen.dart';
import 'package:encryption/view/screen/home/screen_widget/vigen%C3%A8re_cipher_screen.dart';
import 'package:rive/rive.dart';

abstract class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  changeMune(Menu menu);
  changeOpen();
  ceaserChipher();
  ceaserDecrition();
  desEncryption();
  desDecrypt();
  transpoitionEncrypt();
  transpositionDecrypt();
  vigienerEncryption(String text);
  viginerDecryption(String text);
}

class HomeScreenControllerIMP extends HomeScreenController {
  late TextEditingController caesarTextEdditingController;
  late TextEditingController vigenreCipherTextEdditingController;
  late TextEditingController helptranspositionCipherTextEdditingController;
  CaserModuel? caserModuel;
  CaserDecrypt? caserDecrypt;

  Menu selectedSideMenu = sidebarMenus.first;
  bool isSideBarOpen = false;
  int x = 0;

  String name = "NO DATA";
  String? vigenereCipher;
  late AnimationController animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  Menu selectedSideMenu1 = sidebarMenus.first;

  late SMIBool isMenuOpenInput;
  @override
  changeMune(Menu menu) {
    selectedSideMenu = menu;
    update();
  }

  final Screen = [
    CaesarCipherScreenWidget(),
    VigenreCipherScreenWidget(),
    DESScreenWidget(),
    TranspositionCipherScreen(),
  ];

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(
            () {
              update();
            },
          );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    caesarTextEdditingController = TextEditingController();
    helptranspositionCipherTextEdditingController = TextEditingController();
    vigenreCipherTextEdditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    caesarTextEdditingController.dispose();
    helptranspositionCipherTextEdditingController.dispose();
    vigenreCipherTextEdditingController.dispose();
    super.dispose();
  }

  @override
  changeOpen() {
    isSideBarOpen = !isSideBarOpen;
    update();
  }

  @override
  ceaserChipher() {
    DioHelper.postData(url: "sebehenc", data: {
      "text": caesarTextEdditingController.text,
    }).then((value) {
      if (kDebugMode) {
        caserModuel = CaserModuel.fromjson(value.data);
        print(caserModuel!.encrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Encrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserModuel!.encrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  ceaserDecrition() {
    DioHelper.postData(url: "sebehdec", data: {
      "text": caesarTextEdditingController.text,
    }).then((value) {
      if (kDebugMode) {
        caserDecrypt = CaserDecrypt.fromjson(value.data);
        print(caserDecrypt!.decrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Decrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserDecrypt!.decrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  desEncryption() {
    DioHelper.getData(url: "encryptDES").then((value) {
      if (kDebugMode) {
        caserModuel = CaserModuel.fromjson(value.data);
        print(caserModuel!.encrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Encrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserModuel!.encrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  desDecrypt() {
    DioHelper.getData(url: "decryptDES").then((value) {
      if (kDebugMode) {
        caserDecrypt = CaserDecrypt.fromjson(value.data);
        print(caserDecrypt!.decrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Decrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserDecrypt!.decrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  transpoitionEncrypt() {
    DioHelper.postData(url: "encryptTransPosition", data: {
      "text": helptranspositionCipherTextEdditingController.text,
    }).then((value) {
      if (kDebugMode) {
        caserModuel = CaserModuel.fromjson(value.data);
        print(caserModuel!.encrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Encrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserModuel!.encrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  transpositionDecrypt() {
    DioHelper.postData(url: "decrptionTransPosition", data: {
      "text": helptranspositionCipherTextEdditingController.text,
    }).then((value) {
      if (kDebugMode) {
        caserDecrypt = CaserDecrypt.fromjson(value.data);
        print(caserDecrypt!.decrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Decrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserDecrypt!.decrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  vigienerEncryption(String text) {
    DioHelper.postData(url: "encryptveginer", data: {
      "text": text,
    }).then((value) {
      if (kDebugMode) {
        caserModuel = CaserModuel.fromjson(value.data);
        print(caserModuel!.encrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Encrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserModuel!.encrypt!,
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }

  @override
  viginerDecryption(String text) {
    DioHelper.postData(url: "decryptveginer", data: {
      "text": text,
    }).then((value) {
      if (kDebugMode) {
        caserDecrypt = CaserDecrypt.fromjson(value.data);
        print(caserDecrypt!.decrypt);
      }

      Get.defaultDialog(
        backgroundColor: Color(0xFF17203A),
        title: "Decrypt Text",
        titleStyle: TextStyle(color: AppColor.nearlyWhite),
        content: Center(
            child: Text(caserDecrypt!.decrypt!.toLowerCase(),
                style: TextStyle(color: AppColor.nearlyWhite))),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Success'),
        ),
      );
    });
  }
}
