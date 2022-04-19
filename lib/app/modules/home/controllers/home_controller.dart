import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../global/widgets/navigation_item.dart';

class HomeController extends GetxController {
  final box = GetStorage('barberapp');

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(
        Icon(Icons.favorite_border), Text('Favorite'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.search), Text('Search'), Colors.amberAccent),
    NavigationItem(
        Icon(Icons.person_outline), Text('Profile'), Colors.cyanAccent)
  ];

  void choiceIndex(int index) {
    selectedIndex.value = index;
  }

  void boxClear() {
    box.erase();
    Get.offAllNamed('/welcome');
  }
}
