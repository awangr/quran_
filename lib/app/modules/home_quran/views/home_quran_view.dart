import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/modules/home_quran/controllers/home_quran_controller.dart';

import '../../detail_quran/views/detail_view.dart';

class HomeQuranView extends GetView<HomeQuranController> {
  final controller = Get.put(HomeQuranController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<AllSurah>>(
              future: controller.getAllSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      AllSurah surah = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Get.to(DetailView(), arguments: surah);
                          },
                          child: Card(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      child: Center(
                                          child: Text('${surah.number}')),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'asset/icons/circular.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 200,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${surah.name}'),
                                              SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                        Text('${surah.revelation}',
                                            textAlign: TextAlign.start),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text('${surah.translation}'),
                                        SizedBox(width: 5),
                                        Text('(${surah.numberOfAyahs} Ayat)')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      // return Card(
                      //   child: ListTile(
                      //     onTap: () {
                      //       if (surah == 1) {
                      //         Get.reset();
                      //       } else {
                      //         //print('${surah.name}');
                      //         Get.to(DetailView(), arguments: surah);
                      //       }
                      //     },
                      //     title: Text('${surah.name}'),
                      //   ),
                      // );
                    },
                  );
                } else {
                  throw Exception('ERRORR');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
