import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/doa/controllers/doa_controller.dart';

import '../../../model/doa.dart';

class DoaView extends GetView<DoaController> {
  Widget build(BuildContext context) {
    final controller = Get.put(DoaController());
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<Doa>>(
          future: controller.getDoa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Doa? doa = snapshot.data?[index] ?? null;
                  return ListTile(
                    leading: Text('${doa?.id ?? 'Null'}'),
                    title: Text('${doa?.judul ?? 'Null'}'),
                    subtitle: Text('${doa?.arab}'),
                  );
                },
              );
            } else {
              throw Exception('Tidak Ada Data');
            }
          },
        ));
  }
}
