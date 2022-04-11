import 'package:barberapp/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "BarberApp",
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      //initialBinding: GlobalBinding()
      getPages: AppPages.routes,
    ),
  );
}
