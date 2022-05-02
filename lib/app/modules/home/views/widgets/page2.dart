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
          Obx(
            () => Visibility(
              visible: controller.listCompanies.length > 0,
              //visible: controller.completeMarkers.value,
              child: GoogleMap(
                markers: Set.of(controller.markers),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 50.0,
            ),
            child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: () {
                        controller.rebuildMarkers();
                      },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      child: const Icon(Icons.refresh, size: 36.0),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
