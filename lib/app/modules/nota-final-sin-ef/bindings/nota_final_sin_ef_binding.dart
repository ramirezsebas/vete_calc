import 'package:get/get.dart';

import '../controllers/nota_final_sin_ef_controller.dart';

class NotaFinalSinEfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaFinalSinEfController>(
      () => NotaFinalSinEfController(),
    );
  }
}
