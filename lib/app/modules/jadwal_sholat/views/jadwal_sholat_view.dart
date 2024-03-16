import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/jadwal_sholat/controllers/jadwal_sholat_controller.dart';

class JadwalSholatVIew extends GetView<JadwalSholatController> {
  final controller = Get.put(JadwalSholatController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.getSholat();
            },
            child: Text('GET DATA API')),
      ),
    );
  }
}
