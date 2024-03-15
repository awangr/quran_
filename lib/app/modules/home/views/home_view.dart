import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/modules/home/controllers/home_controller.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../detail/views/detail_view.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<AllSurah>>(
              future: controller.getAllSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: // Example 16
                        SimpleCircularProgressBar(
                      mergeMode: true,
                      animationDuration: 1,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      AllSurah surah = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            if (surah == 1) {
                              Get.reset();
                            } else {
                              //print('${surah.name}');
                              Get.to(DetailView(), arguments: surah);
                            }
                          },
                          title: Text('${surah.name}'),
                        ),
                      );
                    },
                  );
                } else {
                  throw Exception('ERRORR');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
