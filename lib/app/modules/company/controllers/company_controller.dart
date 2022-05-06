import 'package:get/get.dart';

import '../../../data/model/company_model.dart';
import '../../../data/model/employee_model.dart';
import '../../../data/model/service_model.dart';
import '../../../routes/app_routes.dart';

class CompanyController extends GetxController {
  final Company company = Get.arguments;

  // void openSchedule(List<Service> services) {
  //   //Acessamos módulo Service passando a nossa lista de serviços
  //   Get.toNamed(Routes.SERVICE, arguments: services);
  // }

  //Abrir a lista de agendamentos, passando o serviço selecionado como argumento
  void createScheduling(Service service) async {
    var result = await Get.toNamed(Routes.SCHEDULES, arguments: service);
    if (result != null) {
      Get.back(result: "OK");
    }
  }
}
