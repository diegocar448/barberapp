import 'dart:convert';

import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:get/get.dart';

import '../provider/schedule_provider.dart';

class ScheduleRepository {
  final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

  //listagem schedules repository
  getAll() async {
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
}
