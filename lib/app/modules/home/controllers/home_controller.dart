import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../global/widgets/navigation_item.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final box = GetStorage('barberapp');

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
        Icon(Icons.home), Text('Inicio'), Color.fromARGB(255, 0, 165, 202)),
    NavigationItem(Icon(Icons.search), Text('Procurar'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person_outline), Text('Perfil'), Colors.teal)
    //NavigationItem(Icon(Icons.search), Text('Search'), Colors.cyanAccent),
    /* NavigationItem(Icon(Icons.person_outline), Text('Profile'),
        Color.fromARGB(255, 0, 168, 168)) */
  ];

  void choiceIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() {
    box.erase();
    Get.offAllNamed(Routes.WELCOME);
    //Get.offAllNamed('/welcome');
  }
}
