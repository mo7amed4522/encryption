// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encryption/controller/binding/initial_bindings.dart';
import 'package:encryption/core/constant/dio_helper.dart';
import 'package:encryption/core/localization/change_local.dart';
import 'package:encryption/core/localization/translation.dart';
import 'package:encryption/core/routes/app_routes.dart';
import 'package:encryption/core/server/my_server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController _controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: _controller.language,
      title: 'Flutter',
      theme: _controller.appThem,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
