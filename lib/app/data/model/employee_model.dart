import 'service_model.dart';

class Employee {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  int? companyId;
  int? userId;
  List<Service>? services;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.companyId,
      this.userId,
      this.services});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    companyId = json['company_id'];
    userId = json['user_id'];
    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['company_id'] = this.companyId;
    data['user_id'] = this.userId;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
