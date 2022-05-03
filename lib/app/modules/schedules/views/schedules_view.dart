import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/schedules_controller.dart';

class SchedulesView extends GetView<SchedulesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar atendimento'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SchedulesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
