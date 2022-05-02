import 'dart:async';

import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/auth_model.dart';
import '../../../data/model/company_model.dart';
import '../../../data/model/schedule_model.dart';
import '../../../data/repository/company_repository.dart';
import '../../../global/widgets/navigation_item.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  //=== Essential - Inicio
  final box = GetStorage('barberapp');
  //Aqui ele vai buscar o ScheduleRepository instanciado em nosso home_binding
  var scheduleRepo = Get.find<ScheduleRepository>();
  var companyRepo = Get.find<CompanyRepository>();
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

  /////////////////////////////////////////////////////////////////////////
  //Page 1 (Observavel)
  //RxList<Schedule> listSchedules = [].obs;
  RxList<Schedule> listSchedules = <Schedule>[].obs;
  /////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////
  //Page 2
  Rx<LatLng> center = LatLng(-23.5204161, -47.4646058).obs;
  //GoogleMap
  Completer<GoogleMapController>? gmapController = Completer();
  LatLng? lastMapPosition;
  Position? currentLocation;
  Set<Marker> markers = {};

  RxList<Company> listCompanies = <Company>[].obs;
  /////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////
  // Page 3
  Auth? auth;
  /////////////////////////////////////////////////////////////////////////

  //responsavel por carregar a lista de agendamento
  @override
  void onInit() async {
    loadData();
    auth = await Auth.fromJson(box.read('auth'));
    await getUserLocation();
    super.onInit();
  }

  //Acessar o repository e vai buscar o valores e setar a lista ao clicar no page1
  void loadData() async {
    //listSchedules.assignAll(await repository.getAll());
    listSchedules.assignAll(await scheduleRepo.getAll());
    //chamamos a lista dentro do loadData
    rebuildMarkers();
    print("/////////////////////////////////////////////////////////");
    print("LOAD DATA ENTROU!");
    print("/////////////////////////////////////////////////////////");

    //listSchedules.clear();
    // listSchedules.value = await scheduleRepo.getAll();
    // listCompanies.value = await companyRepo.getAll();
  }

  void onMapCreated(GoogleMapController controller) async {
    gmapController?.complete(await controller);
  }

  void onCameraMove(CameraPosition position) async {
    lastMapPosition = await position.target;
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

  void loadMarkers() {
    //completeMarkers.value = false;
    if (listCompanies.length > 0) {
      listCompanies.forEach(
        (e) {
          markers.add(
            Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                double.parse(e.latitude!),
                double.parse(e.longitude!),
              ),
              // infoWindow: InfoWindow(
              //   title: e.name,
              //   snippet: e.phone,
              //   onTap: () {
              //     print('Compania clicada ${e.id}');
              //   },
              // ),
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                Get.defaultDialog(
                  title: "${e.name}",
                  content: Text("Telefone: ${e.phone}\nLink: ${e.socialLink}"),
                  actions: [
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        //fechar o Dialog
                        Get.back();
                        //abrir a tela de company passando o Company (e) que foi clicado
                        openCompany(e);
                      },
                      child: Text("Abrir"),
                    ),
                    FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        //fechar o Dialog
                        Get.back();
                      },
                      child: Text("Cancelar"),
                    ),
                  ],
                );
              },
            ),
          );
        },
      );
    }
    // Future.delayed(const Duration(seconds: 1), () {
    //   completeMarkers.value = true;
    // });
  }

  void rebuildMarkers() async {
    listCompanies.assignAll(await companyRepo.getAll());
    loadMarkers();
  }

  //Aqui atualizamos o valor sempre que o usuario clicar no menu correspondente
  void choiceIndex(int index) {
    selectedIndex.value = index;
  }

  // Aqui ele vai para a tela de Company passando o company clicado
  void openCompany(Company company) {
    Get.toNamed(Routes.COMPANY, arguments: company);
  }

  void logout() {
    //box.erase();
    box.remove('auth');
    Get.offAllNamed(Routes.WELCOME);
    //Get.offAllNamed('/welcome');
  }
}
