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
                      // print('${surah?.condition}');
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: Get.width,
                            height: 60,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 42,
                                        height: 42,
                                        child: Center(
                                            child: Text(
                                          '${surah?.number ?? 'null'}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                              'asset/icons/octa.png'),
                                        )),
                                      ),
                                      SizedBox(width: 15),
                                      Text('${surah?.name}')
                                    ],
                                  ),
                                  GetBuilder<MurotalController>(
                                      init: MurotalController(),
                                      builder: (MurotalController c) {
                                        return (surah!.condition == 'stop')
                                            ? TextButton(
                                                onPressed: () {
                                                  controller.playSurah(surah);
                                                },
                                                child: Text('PLAY'))
                                            : TextButton(
                                                onPressed: () {
                                                  controller.stopSurah(surah);
                                                },
                                                child: Text('STOP'));
                                        // ? IconButton(
                                        //     onPressed: () {
                                        //       //kemudian diplay
                                        //       controller.playSurah(surah);
                                        //     },
                                        //     icon: Icon(Icons.play_arrow))
                                        // : IconButton(
                                        //     onPressed: () {
                                        //       //kemudian diplay
                                        //       controller.stopSurah(surah);
                                        //     },
                                        //     icon: Icon(Icons.stop));
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                      // return ListTile(
                      //   //kalau audition stop itu default icon nya adalah play fungsi awalnya adalah stop
                      //   trailing: Obx(() => (controller.audition == 'stop')
                      //       ? IconButton(
                      //           onPressed: () {
                      //             //kemudian diplay
                      //             controller.playSurah(surah?.audio);
                      //           },
                      //           icon: Icon(Icons.play_arrow))
                      //       //kalau icon play diatas di klik muncul Row beserta 2 icon dibawah ini
                      //       //yang memiliki 2 kondisi
                      //       : Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             //kalau audition masih dalam play itu memunculkan 2 icon dibawah beserta fungsinya
                      //             (controller.audition == 'play')
                      //                 ? IconButton(
                      //                     onPressed: () {
                      //                       //pause ketika di klik muncul icon play arrow
                      //                       controller.pauseSurah();
                      //                     },
                      //                     icon: Icon(Icons.pause))
                      //                 : IconButton(
                      //                     onPressed: () {
                      //                       controller.resumeSurah();
                      //                     },
                      //                     icon:
                      //                         Icon(Icons.play_arrow_outlined)),
                      //             IconButton(
                      //                 onPressed: () {
                      //                   //kalau ini di klik akan stop sekaligus mereset surah yang diplay tadi
                      //                   controller.stopSurah();
                      //                 },
                      //                 icon: Icon(Icons.stop))
                      //           ],
                      //         )),
                      //   title: Text('${surah?.name}'),
                      // );
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
