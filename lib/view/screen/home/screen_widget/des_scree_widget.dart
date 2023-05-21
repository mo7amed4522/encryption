// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/controller/home_controller/home_screen_controller.dart';

import 'package:encryption/view/widget/home_widget/screen_widget/center_text_widget.dart';
import 'package:encryption/view/widget/home_widget/screen_widget/encrypt_decrypt_widget.dart';

class DESScreenWidget extends GetView<HomeScreenControllerIMP> {
  const DESScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF17203A),
      child: Column(
        children: [
          SizedBox(height: 80),
          CenterSCreenTittleWidget(
            title: "DES Cipher",
          ),
          Spacer(),
          EncryptDecryptButtonWidget(
            decryptTextButton: () {
              controller.desDecrypt();
            },
            chipherTextButton: () {
              controller.desEncryption();
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
