import 'dart:developer';

import 'package:get/get.dart';

import '../model/service_model.dart';
import '../model/employee_model.dart';
import '../model/schedule_model.dart';
import '../provider/schedule_provider.dart';

class ScheduleRepository {
  final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

  //listagem schedules repository
  Future<List<Schedule>> getAll() async {
    List<Schedule> list = <Schedule>[];
    //converter o Map em uma lista do scheduleModel
    var response = await apiClient.getAll();
    if (response != null) {
      response.forEach((e) {
        list.add(Schedule.fromJson(e));
      });
    }
    return list;
  }

  add(String date, String hourStart, String hourEnd, Employee employee,
      Service service) async {
    return Schedule.fromJson(
      await apiClient.add(date, hourStart, hourEnd, employee, service),
    );
  }
}
