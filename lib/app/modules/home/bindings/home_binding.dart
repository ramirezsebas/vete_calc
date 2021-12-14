import 'package:get/get.dart';
import 'package:vete_calc/app/modules/habilitacion-final/controllers/habilitacion_final_controller.dart';
import 'package:vete_calc/app/modules/nota-final-sin-ef/controllers/nota_final_sin_ef_controller.dart';
import 'package:vete_calc/app/modules/nota-final/controllers/nota_final_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HabilitacionFinalController>(
      () => HabilitacionFinalController(),
    );
    Get.lazyPut<NotaFinalController>(
      () => NotaFinalController(),
    );
    Get.lazyPut<NotaFinalSinEfController>(
      () => NotaFinalSinEfController(),
    );
  }
}
