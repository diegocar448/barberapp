import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../global/widgets/already_have_an_account_acheck.dart';
import '../../../global/widgets/rounded_button.dart';
import '../../../global/widgets/rounded_input_field.dart';
import '../../../global/widgets/rounded_password_field.dart';
import '../../login/widgets/background.dart';
import '../controllers/signup_controller.dart';
import '../widgets/or_divider.dart';
import '../widgets/social_icon.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
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
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                //showPassword: "Senha"
                //changeShowPassword: () {},
                //controller: controller.passwordCtrl,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "REGISTRAR",
                press: () {},
              ),
              SizedBox(height: Get.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.offAndToNamed('/login');
                },
              ),
              OrDivider(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
