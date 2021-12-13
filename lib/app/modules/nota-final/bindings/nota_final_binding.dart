import 'package:get/get.dart';

import '../controllers/nota_final_controller.dart';

class NotaFinalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaFinalController>(
      () => NotaFinalController(),
    );
  }
}
