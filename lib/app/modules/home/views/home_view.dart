import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:quran_api/app/modules/home/controllers/home_controller.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

final controller = Get.put(HomeController());

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<AllSurah>?>(
              future: controller.getAllSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: // Example 16
                        SimpleCircularProgressBar(
                      mergeMode: true,
                      onGetText: (double value) {
                        return Text('${value.toInt()}%');
                      },
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      AllSurah surah = snapshot.data![index];
                      return ListTile(
                        title: Text('${surah.name}'),
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
