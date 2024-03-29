import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model/sholat.dart';

class JadwalSholatController extends GetxController {
  Future<List<Sholat>> getSholat() async {
    Uri url = Uri.parse(
        'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json');
    var res = await http.get(url);
    List? data = json.decode(res.body);
    print(data?[0]);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Sholat.fromJson(e)).toList();
    }
  }
}
