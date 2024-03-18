import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/doa/controllers/doa_controller.dart';

import '../../../model/doa.dart';

class DoaView extends GetView<DoaController> {
  Widget build(BuildContext context) {
    final controller = Get.put(DoaController());
    return Scaffold(
        appBar: AppBar(title: Text('Kumpulan Doa')),
        body: FutureBuilder<List<Doa>>(
          future: controller.getDoa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Doa? doa = snapshot.data?[index] ?? null;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Container(height: 90, width: 7, color: Colors.teal),
                        SizedBox(width: 7),
                        Expanded(
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 8,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {},
                              child: Row(children: [
                                Container(
                                  height: 100,
                                  width: 58,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 10,
                                        top: 30,
                                        child: Container(
                                          child:
                                              Center(child: Text('${doa?.id}')),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'asset/icons/octa.png'))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      width: Get.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${doa?.judul ?? 'null'}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${doa?.arab}',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.end),
                                            Text(
                                              '${doa?.latin}',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                            SizedBox(height: 10),
                                            Text('${doa?.terjemah}',
                                                style: TextStyle(fontSize: 16),
                                                textAlign: TextAlign.start),
                                          ],
                                        ),
                                      )),
                                )
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
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
