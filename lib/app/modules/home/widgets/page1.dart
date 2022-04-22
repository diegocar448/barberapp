import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/schedule_model.dart';
import '../controllers/home_controller.dart';

class Page1 extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
            itemCount: controller.listSchedules.length,
            itemBuilder: (context, index) {
              Schedule schedule = controller.listSchedules[index];
              return ListTile(
                title: Text("${schedule.service?.name}"),
                subtitle: Text("${schedule.schedulingDate}"),
              );
            },
          )),
    );
  }
}
