import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_routes.dart';

class SignupController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  User? user;
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void register() async {
    //entrará aqui após passar pela validação no front-end
    if (formKey.currentState!.validate()) {
      loading.value = true;
      User user = await repository
          .register(usernameCtrl.text, passwordCtrl.text)
          .catchError((e) {
        loading.value = false;
      });
      if (user != null) {
        Get.offAllNamed('/login');
      }
      loading.value = false;
    }
  }

  void toLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
