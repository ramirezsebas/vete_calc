import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vete_calc/app/modules/home/controllers/home_controller.dart';
import 'package:vete_calc/app/modules/nota-final/controllers/nota_final_controller.dart';

import '../controllers/habilitacion_final_controller.dart';

class HabilitacionFinalView extends GetView<HabilitacionFinalController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Obx(
        () => SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                ...controller.parciales
                    .asMap()
                    .entries
                    .map(
                      (element) => TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No puede estar vacio este campo';
                          }
                          if (int.parse(value) > 100) {
                            return 'El puntaje no puede ser mayor a 100';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Ingrese el puntaje del ${element.key + 1} Examen Parcial',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteParcial(element.key);
                            },
                          ),
                          errorStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            controller.parciales[element.key] =
                                double.tryParse(value) ?? 0.0,
                      ),
                    )
                    .toList(),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: controller.addParcial,
                        child: Text("Agregar Parcial")),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState == null) {
                      return;
                    }

                    if (controller.formKey.currentState!.validate()) {
                      int minimoPuntaje = 60 * controller.parciales.length;
                      double total =
                          controller.parciales.reduce((a, b) => a + b);
                      Get.defaultDialog(
                        title: "Resultado",
                        content: Text(total >= minimoPuntaje
                            ? 'Habiltaste 😍'
                            : 'No Habilitaste 😪\nTe falto ${minimoPuntaje - total} puntos'),
                        confirm: TextButton(
                            onPressed: Get.back, child: Text("Aceptar")),
                      );
                    } else {
                      Get.snackbar('Error', 'Ingrese los datos correctamente',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          borderRadius: 10,
                          margin: EdgeInsets.all(10));
                    }
                  },
                  child: Text("Calcular"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
