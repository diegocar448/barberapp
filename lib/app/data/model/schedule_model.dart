class Schedule {
  int? id;
  String? schedulingDate;
  String? schedulingHour;
  String? hourStart;
  String? hourEnd;
  int? userId;
  int? employeeId;
  int? serviceId;

  Schedule(
      {this.id,
      this.schedulingDate,
      this.schedulingHour,
      this.hourStart,
      this.hourEnd,
      this.userId,
      this.employeeId,
      this.serviceId});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schedulingDate = json['scheduling_date'];
    schedulingHour = json['scheduling_hour'];
    hourStart = json['hour_start'];
    hourEnd = json['hour_end'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    serviceId = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduling_date'] = this.schedulingDate;
    data['scheduling_hour'] = this.schedulingHour;
    data['hour_start'] = this.hourStart;
    data['hour_end'] = this.hourEnd;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['service_id'] = this.serviceId;
    return data;
  }
}