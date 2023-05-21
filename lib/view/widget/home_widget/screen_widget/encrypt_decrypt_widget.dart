// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:encryption/core/constant/component.dart';

class EncryptDecryptButtonWidget extends StatelessWidget {
  void Function()? chipherTextButton;
  void Function()? decryptTextButton;
  EncryptDecryptButtonWidget(
      {super.key,
      required this.decryptTextButton,
      required this.chipherTextButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: chipherTextButton,
              child: animatedOptacity("Cipher Text", Colors.blue),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: decryptTextButton,
              child: animatedOptacity("Decrypt Text", Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
