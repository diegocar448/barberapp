import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import '../controllers/initial_controller.dart';
import 'package:http/http.dart' as http;

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
            //após o time seconds ele irá redirecionar para a rota navigateAfter...
            //navigateAfterSeconds: Routes.WELCOME,
            //aqui verificamos se já há uma autenticação feita
            navigateAfterSeconds: controller.verifyAuth(),
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
