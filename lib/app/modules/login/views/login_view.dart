import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../global/widgets/already_have_an_account_acheck.dart';
import '../../../global/widgets/rounded_button.dart';
import '../../../global/widgets/rounded_input_field.dart';
import '../../../global/widgets/rounded_password_field.dart';
import '../controllers/login_controller.dart';
import 'widgets/background.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('LoginView')),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/login.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                RoundedInputField(
                  hintText: "Usuário",
                  controller: controller.usernameCtrl,
                  onChanged: (value) {},
                ),
                //Aqui tornamos o nosso campo/widget de senha uma observavel
                Obx(
                  () => RoundedPasswordField(
                    showPassword: controller.showPassword.value,
                    controller: controller.passwordCtrl,
                    changeShowPassword: () {
                      //aqui ele vai negar o valor atual
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                    onChanged: (value) {},
                  ),
                ),
                //Aqui Obs o RoundedButton será observável
                Obx(
                  () => Visibility(
                    visible: !controller.loading.value,
                    child: RoundedButton(
                      text: "ENTRAR",
                      press: () {
                        controller.login();
                      },
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.loading.value,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: Get.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        //TextButton future
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                          ),
                          onPressed: null,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  //alternará a mensagem quando o login for igual a true ou false
                  login: true,
                  press: () {
                    //Get.offAndToNamed('/signup');
                    controller.toRegister();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
