import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nota_final_sin_ef_controller.dart';

class NotaFinalSinEfView extends GetView<NotaFinalSinEfController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        width: Get.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/image1.png'),
              ),
              TextFormField(
                maxLength: 2,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Ingrese el puntaje de la Bonificación',
                  errorStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No puede estar vacio este campo';
                  }
                  if (int.parse(value) > 15) {
                    return 'El puntaje no puede ser mayor a 15';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) => controller.bonificacion.value =
                    double.tryParse(value) ?? 0.0,
              ),
              SizedBox(
                height: 30,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.red,
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.red,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState == null) {
                      return;
                    }

                    if (controller.formKey.currentState!.validate()) {
                      var m = controller.calcularNotaFinal().asMap();
                      Get.defaultDialog(
                        title: 'Resultado 🤗',
                        content: Text(
                          '\nNota Minima para 2: ${m[1]} \nNota Minima para 3: ${m[2]} \nNota Minima para 4: ${m[3]} \nNota Minima para 5: ${m[4]}',
                        ),
                        actions: [
                          TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Get.back();
                              }),
                        ],
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
                  child: Text("Calcular Nota Final"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
