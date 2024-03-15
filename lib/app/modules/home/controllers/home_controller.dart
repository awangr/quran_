import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final dio = Dio();
  Future<List<AllSurah>?> getAllSurah() async {
    var response = await dio.get(
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json');
    List? data = jsonDecode(response.data);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => AllSurah.fromJson(e)).toList();
    }
  }
}
