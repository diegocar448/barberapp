import '../../../data/provider/auth_provider.dart';
import '../../../data/repository/auth_repository.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
