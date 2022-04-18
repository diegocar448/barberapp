import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final controller;
  bool showPassword;
  VoidCallback? changeShowPassword;

  RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.controller,
    this.showPassword = false,
    this.changeShowPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido.';
          }
          if (value.length < 5) {
            return 'Campo requer mínimo 6 caracteres.';
          }
          return null;
        },
        controller: controller,
        obscureText: !showPassword,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          hintText: "Sua senha",
          icon: Icon(
            Icons.lock,
            color: Get.theme.primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: Get.theme.primaryColor,
            ),
            onPressed: changeShowPassword,
            /* onPressed: () {
              showPassword = !showPassword;
            }, */
          ),
          /* 
          suffixIcon: Icon(
            Icons.visibility,
            color: Get.theme.primaryColor,
          ), */
          border: InputBorder.none,
        ),
      ),
    );
  }
}
