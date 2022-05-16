import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/service_model.dart';
import '../../../data/model/employee_model.dart';
import '../../../data/repository/schedule_repository.dart';
import '../../../routes/app_routes.dart';

class SchedulesController extends GetxController {
  //usamos esse sujeiro em nossas validações no formulario
  final formKey = GlobalKey<FormState>();
  Service? service = Get.arguments;
  final repository = Get.find<ScheduleRepository>();
  DateTime? datePicked;
  TimeOfDay? timePicked;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  Employee? employee = Employee();

  //Abrir Data/Hora do android/ios
  void openCalendar() async {
    datePicked = await showDatePicker(
      context: Get.context!,
      initialDate: datePicked ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (datePicked != null && datePicked != DateTime.now()) {
      dateController.text = DateFormat("dd/MM/yyyy")
          .format(DateTime.parse(datePicked.toString()));
    }
  }

  //Abrir Horario do android/ios
  void openClock() async {
    TimeOfDay time = TimeOfDay.now();
    //desfocar ao clicar
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    //vai abrir o shoTimePicker passando o contexto
    timePicked = await showTimePicker(
      context: Get.context!,
      initialTime: time,
    );
    if (timePicked != null && timePicked != time) {
      //Aqui nós setamos o formato que aparecerá para o usuário
      //timeController.text = timePicked!.toString();
      timeController.text = timePicked!.format(Get.context!);
      time = timePicked!;
    }
  }

  //Abrir pagina do colaborador
  void openEmployeePage() {
    //Get.toNamed(Routes.EMPLOYEE);
  }

  void onsave() async {
    //aqui adicionamos a validação dos campos
    if (formKey.currentState!.validate()) {
      var response = await repository.add(
          dateController.text, timeController.text, employee!, service!);
      if (response != null) {
        Get.back(result: "OK");
      }
    }
  }
}
