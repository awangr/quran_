import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_api/app/model/detail_surah.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  Future<DetailSurah> getDetailSurah(String? nomor) async {
    //INI berfungsi untuk mencari tahu bahwa controller kita terdispose atau tidak
    if (Get.isRegistered<DetailController>()) {
      print('Controller  terdispose');
    } else {
      print('Controller tidak terdispose');
    }
    //Api ini berbentuk sebuah map
    Uri url = Uri.parse('https://quran-api-id.vercel.app/surahs/$nomor');
    var res = await http.get(url);
    Map<String, dynamic> data = jsonDecode(res.body);
    return DetailSurah.fromJson(data);
  }
}
