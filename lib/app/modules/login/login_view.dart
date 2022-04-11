import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginView')),
      body: Container(),
    );
  }
}
