import 'package:get/get.dart';

import '../../../data/model/company_model.dart';
import '../../../data/model/service_model.dart';
import '../../../routes/app_routes.dart';

class CompanyController extends GetxController {
  final Company company = Get.arguments;

  // void openSchedule(List<Service> services) {
  //   //Acessamos módulo Service passando a nossa lista de serviços
  //   Get.toNamed(Routes.SERVICE, arguments: services);
  // }

  //Abrir a lista de agendamentos
  void createScheduling(Service service) {
    Get.toNamed(Routes.SCHEDULES);
  }
}
