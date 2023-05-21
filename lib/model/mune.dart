import 'package:encryption/core/constant/app_photo.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final int path;

  Menu({required this.title, required this.path, required this.rive});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Caesar Cipher",
    rive: RiveModel(
        src: AppPhotoLink.iconsriv,
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
    path: 0,
  ),
  Menu(
    title: "Vigenère Cipher",
    path: 1,
    rive: RiveModel(
        src: AppPhotoLink.iconsriv,
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "DES",
    path: 2,
    rive: RiveModel(
        src: AppPhotoLink.iconsriv,
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Helptransposition cipher",
    path: 3,
    rive: RiveModel(
        src: AppPhotoLink.iconsriv,
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];
