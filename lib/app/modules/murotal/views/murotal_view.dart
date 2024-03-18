import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/modules/home_quran/controllers/home_quran_controller.dart';

class MurotalView extends GetView<HomeQuranController> {
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeQuranController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<AllSurah>>(
              future: homeC.getAllSurah(),
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
                        trailing: IconButton(
                            splashRadius: 4,
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow)),
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
