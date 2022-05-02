import 'dart:convert';

import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../routes/app_routes.dart';
import '../base_url.dart';

class CompanyApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage('barberapp');

  //listagem companies provider
  getAll() async {
    try {
      //String token = await box.read('auth')['access_token'];
      String token = Auth.fromJson(box.read('auth')).accessToken!;

      var response = await http.get(
        Uri.parse(baseUrl + "/companies"),
        headers: {"Authorization": 'Bearer ' + token},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
        //return response.body;
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text("${json.decode(response.body)['error']}"),
        );
      }
    } catch (err) {
      Get.defaultDialog(title: "Error Catch", content: Text("${err}"));
    }
    return null;
  }
}
