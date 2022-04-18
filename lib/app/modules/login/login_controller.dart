import 'package:barberapp/app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/auth_model.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Auth? auth;
  // variavel observavel Rx / .obs
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void login() async {
    //entrará aqui após passar pela validação no front-end
    if (formKey.currentState!.validate()) {
      loading.value = true;
      var res = await repository.login(usernameCtrl.text, passwordCtrl.text);
      loading.value = false;

      print(res.toJson());
    }
  }
}
