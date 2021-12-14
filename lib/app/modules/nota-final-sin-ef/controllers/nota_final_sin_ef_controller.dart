import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotaFinalSinEfController extends GetxController {
  final posiblesNotas = [0, 0, 0, 0, 0].obs;
  final bonificacion = 0.0.obs;
  final notas = {}.obs;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final count = 0.obs;
  final selectedIndex = 0.obs;

  List calcularNotaFinal() {
    posiblesNotas[0] = 59;
    posiblesNotas[1] = 60;
    posiblesNotas[2] = 71;
    posiblesNotas[3] = 81;
    posiblesNotas[4] = 91;
    return posiblesNotas.map((element) {
      var examenFinal = (((100 - bonificacion.value) * element) / 100);
      return examenFinal.round();
    }).toList();
  }
}
