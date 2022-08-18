import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vete_calc/app/modules/habilitacion-final/views/habilitacion_final_view.dart';
import 'package:vete_calc/app/modules/nota-final-sin-ef/views/nota_final_sin_ef_view.dart';
import 'package:vete_calc/app/modules/nota-final/views/nota_final_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Vete Calc'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Escala de Notas",
                content: Column(
                  children: [
                    Text("  5 | 91 - 100"),
                    Text("4 | 81 - 90"),
                    Text("3 | 71 - 80"),
                    Text("2 | 60 - 70"),
                    Text("1 | 00 - 59"),
                  ],
                ),
                confirm: TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            NotaFinalSinEfView(),
            NotaFinalView(),
            HabilitacionFinalView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.price_change),
              label: 'Con Bonificación',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Con EF',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Habilitación Final',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.red,
          onTap: (value) => controller.selectedIndex.value = value,
        );
      }),
    );
  }
}
