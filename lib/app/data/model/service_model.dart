class Service {
  int? id;
  String? name;
  String? description;
  int? cost;
  int? employeeId;

  Service({this.id, this.name, this.description, this.cost, this.employeeId});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    employeeId = json['employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['employee_id'] = this.employeeId;

    return data;
  }
}
