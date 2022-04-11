import 'dart:convert';

import 'package:http/http.dart' as http;

import '../base_url.dart';

class AuthApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + "/login"),
          body: {"username": username, "password": password});

      //Aqui verificamos o qual statusCode retorna da requisição
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('erro -get: ' + response.body);
      }
    } catch (err) {
      print(err);
    }

    return null!;
  }
}
