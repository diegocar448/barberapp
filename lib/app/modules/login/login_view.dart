import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../global/widgets/already_have_an_account_acheck.dart';
import '../../global/widgets/rounded_button.dart';
import '../../global/widgets/rounded_input_field.dart';
import '../../global/widgets/rounded_password_field.dart';
import 'login_controller.dart';
import 'widgets/background.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('LoginView')),
      body: Background(
        child: SingleChildScrollView(
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
                hintText: "Seu Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "ENTRAR",
                press: () {},
              ),
              SizedBox(height: Get.height * 0.03),
              AlreadyHaveAnAccountCheck(
                //alternará a mensagem quando o login for igual a true ou false
                login: true,
                press: () {
                  Get.toNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
