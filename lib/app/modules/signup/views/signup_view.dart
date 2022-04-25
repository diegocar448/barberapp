import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../global/widgets/already_have_an_account_acheck.dart';
import '../../../global/widgets/rounded_button.dart';
import '../../../global/widgets/rounded_input_field.dart';
import '../../../global/widgets/rounded_password_field.dart';
import '../../../routes/app_routes.dart';

import '../controllers/signup_controller.dart';
//import '../widgets/or_divider.dart';
//import '../widgets/social_icon.dart';
import 'widgets/background.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "REGISTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/signup.svg",
                  height: Get.height * 0.35,
                ),
                RoundedInputField(
                  hintText: "Usuário",
                  controller: controller.usernameCtrl,
                  onChanged: (value) {},
                ),
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
                Obx(
                  () => Visibility(
                    visible: !controller.loading.value,
                    child: RoundedButton(
                      text: "REGISTRAR",
                      press: () {
                        controller.register();
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
                  login: false,
                  press: () {
                    controller.toLogin();
                    //Get.offAndToNamed(Routes.LOGIN);
                    //Get.offAndToNamed('/login');
                  },
                ),
                /* OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/google-plus.svg",
                      press: () {},
                    ),
                  ],
                ) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
