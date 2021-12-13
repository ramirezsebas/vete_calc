import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vete_calc/app/modules/habilitacion-final/views/habilitacion_final_view.dart';
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
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            NotaFinalView(),
            HabilitacionFinalView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Nota Final',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
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
