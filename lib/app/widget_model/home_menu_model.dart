import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/doa/views/doa_view.dart';
import '../modules/home_quran/views/home_quran_view.dart';
import '../modules/jadwal_sholat/views/jadwal_sholat_view.dart';
import '../modules/murotal/views/murotal_view.dart';

class Menu {
  String image;
  String text;
  Color color;
  Function()? onTap;
  Menu(this.image, this.text, this.color, this.onTap);
  static List<Menu> listMenu = [
    Menu('asset/images/qoroa.png', 'Quran', Colors.teal.shade400, () {
      Get.to(HomeQuranView());
    }),
    Menu('asset/images/headphone.png', 'Murotal', Colors.amber.shade400, () {
      Get.to(MurotalView());
    }),
    Menu('asset/images/doa.png', 'Doa-Doa', Colors.blue.shade400, () {
      Get.to(DoaView());
    }),
    Menu('asset/images/adzan.png', 'Jadwal Sholat', Colors.cyan.shade400, () {
      Get.to(JadwalSholatVIew());
    }),
  ];
}
