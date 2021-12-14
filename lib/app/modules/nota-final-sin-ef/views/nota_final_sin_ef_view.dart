import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nota_final_sin_ef_controller.dart';

class NotaFinalSinEfView extends GetView<NotaFinalSinEfController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotaFinalSinEfView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotaFinalSinEfView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
