import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Aqui nós temos a nossa snackBar personalizada
class SnackBarCustom {
  static void show(String title, String subtitle, Color color) {
    Get.snackbar(
      "$title",
      "$subtitle",
      icon: Icon(Icons.notification_important),
      shouldIconPulse: true,
      barBlur: 20,
      isDismissible: true,
      backgroundColor: color,
      snackPosition: SnackPosition.BOTTOM,
      //margin: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    );
  }

  static primary(String title, String subtitle) {
    show(title, subtitle, Color(0xFFcce5ff));
  }

  static secondary(String title, String subtitle) {
    show(title, subtitle, Color(0xFFe2e3e5));
  }

  static success(String title, String subtitle) {
    show(title, subtitle, Color(0xFFd4edda));
  }

  static danger(String title, String subtitle) {
    show(title, subtitle, Color(0xFFf8d7da));
  }

  static warning(String title, String subtitle) {
    show(title, subtitle, Color(0xFFfff3cd));
  }

  static info(String title, String subtitle) {
    show(title, subtitle, Color(0xFFd1ecf1));
  }

  static light(String title, String subtitle) {
    show(title, subtitle, Color(0xFFfefefe));
  }

  static dark(String title, String subtitle) {
    show(title, subtitle, Color(0xFFd6d8d9));
  }
}
