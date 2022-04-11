import 'package:get/get.dart';

import '../modules/initial/initial_binding.dart';
import '../modules/initial/initial_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
