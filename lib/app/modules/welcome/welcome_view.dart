import 'package:barberapp/app/modules/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../global/widgets/rounded_button.dart';
import 'widgets/background.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Bem vindo ao BarberApp')),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bem vindo ao BarberApp",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              SvgPicture.asset(
                "assets/chat.svg",
                height: Get.height * 0.45,
              ),
              SizedBox(height: Get.height * 0.05),
              RoundedButton(
                text: "Acessar",
                color: Get.theme.primaryColorLight,
                textColor: Colors.black,
                press: () {
                  Get.offAndToNamed('/login');
                },
              ),
              RoundedButton(
                text: "Registrar",
                color: Get.theme.primaryColorLight,
                textColor: Colors.black,
                press: () {
                  Get.offAndToNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
