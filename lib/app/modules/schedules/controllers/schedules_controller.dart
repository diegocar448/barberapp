import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/service_model.dart';

class SchedulesController extends GetxController {
  Service? service = Get.arguments;
  DateTime? datePicked;
  TimeOfDay? timePicked;
  TextEditingController? dateController = TextEditingController();
  TextEditingController? timeController = TextEditingController();
  Employee? employee;

  //Abrir Data/Hora
  void openCalendar() {}

  //Abrir Horario
  void openClock() {}
}
