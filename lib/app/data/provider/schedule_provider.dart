import 'dart:convert';

import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../routes/app_routes.dart';
import '../../global/constants.dart';
import '../model/schedule_model.dart';
import '../model/service_model.dart';

class ScheduleApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage('barberapp');

  //listagem schedules provider
  getAll() async {
    try {
      //String token = await box.read('auth')['access_token'];
      String token = Auth.fromJson(box.read('auth')).accessToken!;

      var response = await http.get(
        Uri.parse(baseUrl + "/schedules"),
        headers: {"Authorization": 'Bearer ' + token},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
        //return response.body;
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text("${json.decode(response.body)['error']}"));
        //print('erro -get: ' + response.body);
      }
    } catch (err) {
      Get.defaultDialog(title: "Error Catch", content: Text("${err}"));
      //print(err);

      //em caso de erro (token expirado) redirecionará para welcome e limpará getStorage()
      box.erase();
      Get.offAndToNamed(Routes.WELCOME);
    }
    return null;
  }

  //metodo store ScheduleController
  add(String date, String time, Employee employee, Service service) async {
    try {
      //String token = await box.read('auth')['access_token'];
      Auth auth = Auth.fromJson(box.read('auth'));
      String token = auth.accessToken!;
      int userId = auth.user!.id!;

      //quebrando a data [ dia/mes/ano para [dia, mes, ano] ] para estruturar no formato americano antes de enviar
      var dt = date.split('/');
      var newDate = dt[2] +
          '-' +
          dt[1] +
          '-' +
          dt[0] +
          ' ' +
          time +
          ':00'; //enviando segundos zerado

      var response = await http.post(
        Uri.parse(baseUrl + "/schedules"),
        body: {
          "scheduling_date": "$newDate",
          "user_id": "$userId",
          "employee_id": "${employee?.id ?? ''}",
          "service_id": "${service.id}",
        },
        headers: {"Authorization": 'Bearer ' + token},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
        //return response.body;
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text("${json.decode(response.body)['error']}"));
        //print('erro -get: ' + response.body);
      }
    } catch (err) {
      Get.defaultDialog(title: "Error Catch", content: Text("${err}"));
      //print(err);

      //em caso de erro (token expirado) redirecionará para welcome e limpará getStorage()
      box.erase();
      Get.offAndToNamed(Routes.WELCOME);
    }
    return null;
  }
}
