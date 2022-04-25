import 'package:barberapp/app/data/repository/auth_repository.dart';

import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/auth_model.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();

  Auth? auth;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final box = GetStorage('barberapp');
  // variavel observavel Rx / .obs
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void login() async {
    // try {
    if (formKey.currentState!.validate()) {
      loading.value = true;
      var auth = await repository.login(usernameCtrl.text, passwordCtrl.text);

      //if (auth != null) {
      if (!auth.isNull) {
        //Aqui armazenamos o retorno da requisição de autenticação em nosso storage getStorage
        await box.write('auth', auth);

        //redirecinar para home fechando a view anterior
        Get.offAllNamed(Routes.HOME);
        //Get.offAllNamed('/home');
      }

      loading.value = false;
    }
    // } catch (e) {
    //   loading.value = false;
    // }
    //entrará aqui após passar pela validação no front-end
  }

  void toRegister() {
    Get.offAndToNamed(Routes.SIGNUP);
  }
}
