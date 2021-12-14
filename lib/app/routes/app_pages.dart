import 'package:get/get.dart';

import 'package:vete_calc/app/modules/habilitacion-final/bindings/habilitacion_final_binding.dart';
import 'package:vete_calc/app/modules/habilitacion-final/views/habilitacion_final_view.dart';
import 'package:vete_calc/app/modules/home/bindings/home_binding.dart';
import 'package:vete_calc/app/modules/home/views/home_view.dart';
import 'package:vete_calc/app/modules/nota-final-sin-ef/bindings/nota_final_sin_ef_binding.dart';
import 'package:vete_calc/app/modules/nota-final-sin-ef/views/nota_final_sin_ef_view.dart';
import 'package:vete_calc/app/modules/nota-final/bindings/nota_final_binding.dart';
import 'package:vete_calc/app/modules/nota-final/views/nota_final_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HABILITACION_FINAL,
      page: () => HabilitacionFinalView(),
      binding: HabilitacionFinalBinding(),
    ),
    GetPage(
      name: _Paths.NOTA_FINAL,
      page: () => NotaFinalView(),
      binding: NotaFinalBinding(),
    ),
    GetPage(
      name: _Paths.NOTA_FINAL_SIN_EF,
      page: () => NotaFinalSinEfView(),
      binding: NotaFinalSinEfBinding(),
    ),
  ];
}
