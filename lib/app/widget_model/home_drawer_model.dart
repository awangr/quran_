import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_api/app/modules/doa/views/doa_view.dart';
import 'package:quran_api/app/modules/home_quran/views/home_quran_view.dart';
import 'package:quran_api/app/modules/jadwal_sholat/views/jadwal_sholat_view.dart';
import 'package:quran_api/app/modules/murotal/views/murotal_view.dart';

class DrawerTile {
  String title;
  Icon icon;
  Function()? onTap;
  DrawerTile(this.title, this.icon, this.onTap);
  static List<DrawerTile> listDrawer = [
    DrawerTile('Home', Icon(Icons.home), () => Get.to(HomeQuranView())),
    DrawerTile('Murotal', Icon(Icons.home), () => Get.to(MurotalView())),
    DrawerTile('Doa-doa', Icon(Icons.home), () => Get.to(DoaView())),
    DrawerTile(
        'Jadwal Sholat', Icon(Icons.home), () => Get.to(JadwalSholatVIew()))
  ];
}
