// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/controller/home_controller/home_screen_controller.dart';
import 'package:encryption/core/constant/app_photo.dart';
import 'package:encryption/core/constant/component.dart';
import 'package:encryption/view/widget/home_widget/screen_widget/center_text_widget.dart';
import 'package:encryption/view/widget/home_widget/screen_widget/encrypt_decrypt_widget.dart';

class CaesarCipherScreenWidget extends GetView<HomeScreenControllerIMP> {
  const CaesarCipherScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Container(
      color: Color(0xFF17203A),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 80),
            CenterSCreenTittleWidget(
              title: "Caesar Cipher",
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: defaultTextForm(
                color: Colors.white,
                prefix: AppPhotoLink.lock,
                controller: controller.caesarTextEdditingController,
                keyboardType: TextInputType.name,
                label: 'Plaintext Text',
                onSubmit: (value) {},
                onChange: (value) {},
                onTap: () {},
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Plaintext must be not empty';
                  }
                },
              ),
            ),
            Spacer(),
            EncryptDecryptButtonWidget(
              decryptTextButton: () {
                if (formKey.currentState!.validate()) {
                  controller.ceaserDecrition();
                } else {
                  Get.snackbar("Error !!", "you must add value",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              chipherTextButton: () {
                if (formKey.currentState!.validate()) {
                  controller.ceaserChipher();
                } else {
                  Get.snackbar("Error !!", "you must add value",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
