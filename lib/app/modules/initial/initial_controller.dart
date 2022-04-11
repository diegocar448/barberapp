import 'package:get/get.dart';

class InitialController extends GetxController {
  //variavel reativa
  //RxString? btText = "Botao clicado 0 vezes".obs;
  RxInt? num = 0.obs;

  btClick() {
    num!.value++;
    //btText!.value = "Botao clicado $num vezes";
  }
}
