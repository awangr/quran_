import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/modules/murotal/controllers/murotal_controller.dart';

class MurotalView extends GetView<MurotalController> {
  Widget build(BuildContext context) {
    final controller = Get.put(MurotalController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<AllSurah>>(
              future: controller.getAllSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      AllSurah? surah = snapshot.data?[index] ?? null;
                      return ListTile(
                        onTap: () {
                          controller.playSurah(surah?.audio);
                        },
                        trailing: Icon(Icons.play_arrow),
                        title: Text('${surah?.name}'),
                      );
                    },
                  );
                } else {
                  throw Exception('Tidak ada data');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
