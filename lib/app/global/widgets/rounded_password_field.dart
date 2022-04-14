import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? showPassword;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.showPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
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
            onPressed: showPassword,
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
