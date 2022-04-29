import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/home_controller.dart';

class Page2 extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GoogleMap(
            //markers: Set.of(controller.markers),
            initialCameraPosition: CameraPosition(
              target: controller.center.value,
              zoom: 14.0,
            ),
            onMapCreated: controller.onMapCreated,
            zoomGesturesEnabled: true,
            onCameraMove: controller.onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            mapToolbarEnabled: false,
          ),
        ],
      ),
    );
  }
}
