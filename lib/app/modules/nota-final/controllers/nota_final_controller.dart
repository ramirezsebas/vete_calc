import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotaFinalController extends GetxController {
  final examenFinal = 0.0.obs;
  final bonificacion = 0.0.obs;
  final examenParcial = 0.0.obs;
  final notas = {}.obs;
  final _mensajeErrorEF = "".obs;
  final _mensajeErrorB = "".obs;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String get mensajeErrorEF => _mensajeErrorEF.value;
  String get mensajeErrorB => _mensajeErrorB.value;

  set mensajeErrorEF(String value) {
    _mensajeErrorEF.value = value;
  }

  set mensajeErrorB(String value) {
    _mensajeErrorB.value = value;
  }

  final count = 0.obs;
  final selectedIndex = 0.obs;

  isHabilitado() {
    if (examenFinal.value == 0.0 || examenParcial.value == 0.0) {
      return false;
    }
    return true;
  }

  double calcularPuntajeFinal() {
    var a = ((100 - bonificacion.value) * 10) / 100;
    return 0.0;
  }

  int calcularNotaFinal() {
    var puntajeFinal = (examenFinal.value * 100) / (100 - bonificacion.value);

    if (puntajeFinal >= 0 && puntajeFinal <= 59) {
      return 1;
    } else if (puntajeFinal >= 60 && puntajeFinal <= 70) {
      return 2;
    } else if (puntajeFinal >= 71 && puntajeFinal <= 80) {
      return 3;
    } else if (puntajeFinal >= 81 && puntajeFinal <= 90) {
      return 4;
    }

    return 5;
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
