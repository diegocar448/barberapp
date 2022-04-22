import 'dart:convert';

import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:get/get.dart';

import '../provider/schedule_provider.dart';

class ScheduleRepository {
  final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

  //listagem schedules repository
  getAll() async {
    List<Schedule> list = <Schedule>[];

    try {
      //converter o Map em uma lista do scheduleModel
      var response = await apiClient.getAll();

      response.forEach((e) async {
        print(Schedule.fromJson(await e).toJson());
        //adicionar cada map em nossa list
        list.add(Schedule.fromJson(await e));
      });
      return list;
    } catch (e) {}

    return list;

    // List<Schedule> list = <Schedule>[];

    // //var response = await apiClient.getAll();
    // var response = json.decode(await apiClient.getAll());

    // response.forEach((e) {
    //   //adicionar cada map em nossa list
    //   list.add(Schedule.fromJson(e));
    // });

    // return list;
  }
}
