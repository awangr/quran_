import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/home/views/home_view.dart';

import 'app/modules/doa/views/doa_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoaView(),
      initialRoute: '/',
    );
  }
}
