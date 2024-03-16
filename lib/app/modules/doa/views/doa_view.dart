import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/doa/controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  Widget build(BuildContext context) {
    final controller = Get.put(DoaController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.getDoa();
            },
            child: Text('GET API')),
      ),
    );
  }
}
