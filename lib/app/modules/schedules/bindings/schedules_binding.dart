import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:get/get.dart';

import '../../../data/provider/schedule_provider.dart';
import '../controllers/schedules_controller.dart';

class SchedulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulesController>(
      () => SchedulesController(),
    );
    Get.lazyPut<ScheduleRepository>(
      () => ScheduleRepository(),
    );
    Get.lazyPut<ScheduleApiClient>(
      () => ScheduleApiClient(),
    );
  }
}
