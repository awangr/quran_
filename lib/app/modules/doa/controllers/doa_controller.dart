import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_api/app/model/doa.dart';
import 'package:http/http.dart' as http;

class DoaController extends GetxController {
  Future<List<Doa>> getDoa() async {
    Uri url = Uri.parse('https://open-api.my.id/api/doa');
    var response = await http.get(url);
    List? data = json.decode(response.body);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Doa.fromJson(e)).toList();
    }
  }
}
