import 'package:get/get.dart';
import 'package:vete_calc/app/modules/home/controllers/home_controller.dart';

import '../controllers/habilitacion_final_controller.dart';

class HabilitacionFinalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HabilitacionFinalController>(
      () => HabilitacionFinalController(),
    );
    
  }
}
