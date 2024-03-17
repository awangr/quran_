import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/model/detail_surah.dart';
import 'package:quran_api/app/modules/detail_quran/controllers/detail_controller.dart';

class DetailView extends GetView<DetailQuranController> {
  final controller = Get.put(DetailQuranController());

  Widget build(BuildContext context) {
    final AllSurah? surah = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('${surah?.name ?? 'NULL'}')),
        body: FutureBuilder<DetailSurah>(
          future: controller.getDetailSurah(surah?.number.toString() ?? 'NULL'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.teal, color: Colors.pink));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.ayahs?.length,
                itemBuilder: (context, index) {
                  if (snapshot.data?.ayahs?.length == 0) {
                    return SizedBox();
                  }
                  //ini untuk mengambil data dari ayat
                  Ayahs? ayahs = snapshot.data!.ayahs![index];
                  return Column(
                    children: [
                      Text(ayahs.arab ?? 'null'),
                      SizedBox(height: 10),
                      Text(ayahs.translation ?? 'null'),
                    ],
                  );
                },
              );
            } else {
              return Text('Error');
            }
          },
        ));
  }
}
