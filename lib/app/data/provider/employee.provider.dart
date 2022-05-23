import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../routes/app_routes.dart';
import '../model/auth_model.dart';

class EmployeeApiClient extends GetConnect {
  //final http.Client httpClient = http.Client();
  final box = GetStorage('barberapp');

  getAll() async {
    try {
      //String token = await box.read('auth')['access_token'];
      Auth auth = Auth.fromJson(box.read('auth'));

      var response = await http.get(
        Uri.parse(
            baseUrl! + "/employee/schedules/${auth.user!.employees![0].id}"),
        headers: {"Authorization": 'Bearer ' + auth.accessToken!},
      );

      print(json.decode(response.body));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text("${json.decode(response.body)['error']}"));
      }
    } catch (err) {
      Get.defaultDialog(title: "Error Catch", content: Text("${err}"));

      //em caso de erro (token expirado) redirecionará para welcome e limpará getStorage()
      box.erase();
      Get.offAndToNamed(Routes.WELCOME);
    }
    return null;
  }
}
