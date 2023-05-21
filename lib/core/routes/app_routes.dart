import 'package:get/get.dart';
import 'package:encryption/core/middleware/my_middleware.dart';
import 'package:encryption/core/routes/router.dart';
import 'package:encryption/view/screen/home/home_screen.dart';
import 'package:encryption/view/screen/start_screen/start_screen.dart';

List<GetPage<dynamic>>? routes = [
  //================= Home =============//

  GetPage(
      name: AppRoutes.start,
      page: () => const StartScreen(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
];
