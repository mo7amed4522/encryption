// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/core/server/my_server.dart';
import 'package:encryption/core/theme/app_theme.dart';

class LocalController extends GetxController {
  ThemeData appThem = themeEnglish;

  Locale? language;

  MyServices myServices = Get.find();

  changeLanguage(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    appThem = language == "AR" ? themeArabic : themeEnglish;
    Get.changeTheme(appThem);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == "AR") {
      language = const Locale("AR");
      appThem = themeArabic;
    } else if (sharedPrefLang == "EN") {
      language = const Locale("EN");
      appThem = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appThem = themeEnglish;
    }
    super.onInit();
  }
}
