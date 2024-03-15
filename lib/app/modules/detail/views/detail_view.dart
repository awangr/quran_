import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/model/detail_surah.dart' as detailSurah;
import 'package:quran_api/app/modules/detail/controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final controller = Get.put(DetailController());

  Widget build(BuildContext context) {
    final AllSurah? surah = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('${surah?.name ?? 'NULL'}')),
        body: FutureBuilder<detailSurah.DetailSurah>(
          future: controller.getDetailSurah(surah?.number.toString() ?? 'NULL'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.ayahs?.length,
                itemBuilder: (context, index) {
                  if (snapshot.data?.ayahs?.length == 0) {
                    return SizedBox();
                  }
                  //ini untuk mengambil data dari ayat
                  detailSurah.Ayahs? ayahs = snapshot.data!.ayahs![index];
                  return Column(
                    children: [
                      Text(ayahs.arab ?? ''),
                      SizedBox(height: 10),
                      Text(ayahs.translation ?? ''),
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
