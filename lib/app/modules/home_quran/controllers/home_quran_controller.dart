import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quran_api/app/model/all_surah.dart';

class HomeQuranController extends GetxController {
  Future<List<AllSurah>> getAllSurah() async {
    if (Get.isRegistered<HomeQuranController>()) {
      print('Controller  terdispose');
    } else {
      print('Controller tidak terdispose');
    }
    //Api ini berbentuk sebuah List []
    Uri url = Uri.parse('https://quran-api-id.vercel.app/surahs');
    var response = await http.get(url);
    List? data = json.decode(response.body);

    if (data == null || data.isEmpty) {
      return [];
    } else {
      //kemudian diubah menjadi sebuah map
      return data.map((e) => AllSurah.fromJson(e)).toList();
    }
  }
}
