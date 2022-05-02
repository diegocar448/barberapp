import 'package:get/get.dart';

import '../../../data/model/company_model.dart';
import '../../../data/model/service_model.dart';
import '../../../routes/app_routes.dart';

class CompanyController extends GetxController {
  final Company company = Get.arguments;

  void openService(List<Service> services) {
    //Acessamos módulo Service passando a nossa lista de serviços
    Get.toNamed(Routes.SERVICE, arguments: services);
  }
}
