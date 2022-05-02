import 'package:barberapp/app/data/model/company_model.dart';
import 'package:get/get.dart';

import '../provider/company_provider.dart';

class CompanyRepository {
  final CompanyApiClient apiClient = Get.find<CompanyApiClient>();

  //listagem companies repository
  getAll() async {
    List<Company> list = <Company>[];
    //converter o Map em uma lista do CompanyModel
    var response = await apiClient.getAll();
    if (response != null) {
      response.forEach((e) {
        list.add(Company.fromJson(e));
      });
    }

    return list;
  }
}
