import 'dart:async';

import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/auth_model.dart';
import '../../../data/model/schedule_model.dart';
import '../../../global/widgets/navigation_item.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  //=== Essential - Inicio
  final box = GetStorage('barberapp');
  //Aqui ele vai buscar o ScheduleRepository instanciado em nosso home_binding
  var repository = Get.find<ScheduleRepository>();
  //=== Essential - Final

  // Button Nav Custom
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
        Icon(Icons.home), Text('Inicio'), Color.fromARGB(255, 0, 165, 202)),
    NavigationItem(Icon(Icons.search), Text('Procurar'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person_outline), Text('Perfil'), Colors.teal)
  ];

  // Page 1 (Observavel)
  //RxList<Schedule> listSchedules = [].obs;
  RxList<Schedule> listSchedules = <Schedule>[].obs;

  //Page 2
  Rx<LatLng> center = LatLng(0, 0).obs;
  LatLng? lastMapPosition;
  //GoogleMap
  Completer<GoogleMapController>? gmapController = Completer();
  Position? currentLocation;

  // Page 3
  Auth? auth;

  //responsavel por carregar a lista de agendamento
  @override
  void onInit() {
    loadData();
    auth = Auth.fromJson(box.read('auth'));
    getUserLocation();
    super.onInit();
  }

  //Acessar o repository e vai buscar o valores e setar a lista ao clicar no page1
  void loadData() async {
    //listSchedules.assignAll(await repository.getAll());
    //listSchedules.assignAll(await repository.getAll());

    //listSchedules.clear();
    listSchedules.value = await repository.getAll();
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController?.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  //Aqui eu pego a latitude e longitude da posição atual
  getUserLocation() async {
    currentLocation = await locateUser();
    center.value =
        LatLng(currentLocation!.latitude, currentLocation!.longitude);
    print('center $center');
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  //Aqui atualizamos o valor sempre que o usuario clicar no menu correspondente
  void choiceIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() {
    //box.erase();
    box.remove('auth');
    Get.offAllNamed(Routes.WELCOME);
    //Get.offAllNamed('/welcome');
  }
}
