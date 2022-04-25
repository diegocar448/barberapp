// ignore_for_file: void_checks

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';

class InitialController extends GetxController {
  final box = GetStorage('barberapp');
  var auth;

  //aqui verificamos se o usuario ja foi autenticado
  verifyAuth() {
    auth = box.read('auth');
    if (auth != null) {
      return Routes.HOME;
    } else {
      return Routes.WELCOME;
    }
  }
}
