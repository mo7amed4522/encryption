// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  bool formEnable = true,
  bool readOnly = false,
  required String prefix,
  IconData? suffix,
  Function? suffixPress,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required color,
  required Function validate,
  bool isPassword = false,
}) =>
    TextFormField(
      style: TextStyle(
        color: color,
      ),
      readOnly: readOnly,
      obscureText: isPassword,
      enabled: formEnable,
      controller: controller,
      keyboardType: keyboardType,
      onTap: () {
        onTap!();
      },
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      onChanged: (value) {
        onChange!(value);
      },
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        labelText: label,
        prefixIcon: Lottie.asset(prefix, height: 16),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPress!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget animatedOptacity(String text, Color? color) {
  return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: 0.99,
      child: Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 16, right: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 175, 180, 207),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                            child: Text(
                          text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color,
                              fontFamily: "Poppins",
                              fontSize: 20),
                        ))))
              ])));
}
