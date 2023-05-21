// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:encryption/core/theme/theme_color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColor.black,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColor.black,
      ),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 15)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColor.black,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColor.black,
      ),
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 15)),
  primarySwatch: Colors.blue,
);
