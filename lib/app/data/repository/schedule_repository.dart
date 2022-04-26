import 'dart:convert';

import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:get/get.dart';

import '../provider/schedule_provider.dart';

class ScheduleRepository {
  final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

  //listagem schedules repository
  getAll() async {
    List<Schedule> list = await <Schedule>[];
    //converter o Map em uma lista do scheduleModel
    var response = await apiClient.getAll();
    response.forEach((e) async {
      list.add(Schedule.fromJson(await e));
    });
    return list;
  }
}
