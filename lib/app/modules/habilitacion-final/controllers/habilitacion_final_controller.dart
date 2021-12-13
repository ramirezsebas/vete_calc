import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabilitacionFinalController extends GetxController {
  final parciales = [0.0, 0.0].obs;
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
