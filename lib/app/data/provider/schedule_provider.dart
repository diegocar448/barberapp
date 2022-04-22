import 'dart:convert';

import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../base_url.dart';

class ScheduleApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage('barberapp');

  //listagem schedules provider
  getAll() async {
    try {
      //String token = box.read('auth')['access_token'];
      var token = Auth.fromJson(box.read('auth')).accessToken;

      var response = await http.get(
        Uri.parse(baseUrl + "/schedules"),
        headers: {"Authorization": 'Bearer ' + token.toString()},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text("${json.decode(response.body)['error']}"));
        print('erro -get: ' + response.body);
      }
    } catch (err) {
      Get.defaultDialog(title: "Error Catch", content: Text("${err}"));
      print(err);
    }
    //return null;
  }
}