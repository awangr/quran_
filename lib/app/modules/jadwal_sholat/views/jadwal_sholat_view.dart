import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/sholat.dart';
import 'package:quran_api/app/modules/jadwal_sholat/controllers/jadwal_sholat_controller.dart';

class JadwalSholatVIew extends GetView<JadwalSholatController> {
  final controller = Get.put(JadwalSholatController());
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<Sholat>>(
                future: controller.getSholat(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Sholat? sholat = snapshot.data?[index] ?? null;
                        return ListTile(
                          title: Text('${sholat?.tanggal ?? 'Error'}'),
                        );
                      },
                    );
                  } else {
                    throw Exception('ERROR');
                  }
                },
              )
            ],
          ),
        ));
  }
}
