import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabilitacionFinalController extends GetxController {
  final parciales = [0.0, 0.0].obs;
  final tp = 0.0.obs;
  final asistencia = 0.0.obs;
  final bonificacionTP = 0.0.obs;
  final bonificacionParciales = 0.0.obs;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void addParcial() {
    if (parciales.length < 4 && parciales.length >= 2) {
      parciales.add(0.0);
      return;
    }
    Get.defaultDialog(
      title: 'Oye tranquilo viejo/a',
      content: Text('No puedes agregar mas parciales'),
      confirm: TextButton(onPressed: Get.back, child: Text("Aceptar")),
    );
  }

  void showPuntaje() {
    int minimoPuntaje = 60 * parciales.length;
    double total = parciales.reduce((a, b) => a + b);
    String mensajeSuccess = 'Felicidades 😍. Habilitaste';
    bool isSuccess = true;
    String mensajeError = "No Habilitaste\n";
    if (total < minimoPuntaje) {
      isSuccess = false;
      mensajeError +=
          "\n😪Te falto ${minimoPuntaje - total} puntos en los Parciales";
    }
    if (tp.value < 80) {
      isSuccess = false;
      mensajeError += "\n😪Te falto ${80 - tp.value} puntos en TP";
    }
    if (asistencia.value < 70) {
      isSuccess = false;
      mensajeError +=
          "\n😪Te falto ${80 - asistencia.value} puntos en Asistencia";
    }
    if (isSuccess) {
      if (total >= 91 * parciales.length && total <= 100 * parciales.length) {
        bonificacionTP.value = 10;
      } else if (total >= 81 * parciales.length &&
          total < 90 * parciales.length) {
        bonificacionTP.value = 7;
      } else if (total >= 71 * parciales.length &&
          total < 80 * parciales.length) {
        bonificacionTP.value = 5;
      }

      if (tp.value >= 90 && tp.value <= 100) {
        bonificacionParciales.value = 5;
      } else if (tp.value >= 80 && tp.value < 90) {
        bonificacionParciales.value = 2;
      }

      if (bonificacionParciales.value != 0) {
        mensajeSuccess +=
            "\nObtuviste una bonificación de parciales de ${bonificacionParciales.value} puntos";
      }
      if (bonificacionTP.value != 0) {
        mensajeSuccess +=
            "\nObtuviste una bonificación de TP de ${bonificacionTP.value} puntos";
      }
    }

    Get.defaultDialog(
      title: "Resultado",
      content: Text(!isSuccess ? mensajeError : mensajeSuccess),
      confirm: TextButton(onPressed: Get.back, child: Text("Aceptar")),
    );
  }

  double calcular() {
    double total = 0.0;
    for (var parcial in parciales) {
      total += parcial;
    }
    return total;
  }

  void deleteParcial(int index) {
    if (parciales.length <= 4 && parciales.length > 2) {
      parciales.removeAt(index);
      return;
    }
    Get.defaultDialog(
      title: 'Oye tranquilo viejo/a',
      content: Text('Como minimo debes tener 2 parciales'),
      confirm: TextButton(onPressed: Get.back, child: Text("Aceptar")),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
