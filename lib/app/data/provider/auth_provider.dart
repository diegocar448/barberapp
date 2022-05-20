import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../global/constants.dart';

class AuthApiClient {
  final http.Client httpClient = http.Client();
  final box = GetStorage('barberapp');

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + "/login"),
          body: {"username": username, "password": password});

      //Aqui verificamos o qual statusCode retorna da requisição
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        print("//////////////////////////////////////");
        print(response.statusCode);
        print("//////////////////////////////////////");

        Get.defaultDialog(
            title: "Login inválido!",
            content: Text("Favor verificar usuário e senha"));

        return json.decode(response.body);
      } else {}
    } catch (err) {
      print(err);
    }

    return null!;
  }

  //Provider para criar um novo usuario acessando api
  Future<Map<String, dynamic>> register(
      String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + "/register"),
          body: {"username": username, "password": password});

      //Aqui verificamos o qual statusCode retorna da requisição
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "Cadastro",
            content: Text("${json.decode(response.body)['message']}"));
        //return json.decode(response.body);
        return json.decode(response.body);
      } else {
        //snotify do getX
        Get.defaultDialog(
            title: "Cadastro",
            content: Text("${json.decode(response.body)['message']}"));
        //print('erro -get: ' + response.body);
      }
    } catch (err) {
      Get.defaultDialog(title: "Cadastro", content: Text("${err}"));
      print(err);
    }

    return null!;
  }
}
