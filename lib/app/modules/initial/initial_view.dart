import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initial_controller.dart';
import 'package:http/http.dart' as http;

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InitialPage'),
        actions: [
          IconButton(
              icon: Icon(Icons.cake),
              onPressed: () {
                controller.btClick();
              }),
        ],
      ),
      body: Container(
          //
          ),
    );
  }
}
