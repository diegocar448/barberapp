import 'package:barberapp/app/data/provider/employee.provider.dart';
import 'package:get/get.dart';

import '../model/schedule_model.dart';

class EmployeeRepository {
  //Injeção de dependencias
  final EmployeeApiClient apiClient = Get.find<EmployeeApiClient>();

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
}
