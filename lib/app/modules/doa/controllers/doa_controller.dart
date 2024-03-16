import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_api/app/model/doa.dart';
import 'package:http/http.dart' as http;

class DoaController extends GetxController {
  Future getDoa() async {
    Uri url = Uri.parse('https://open-api.my.id/api/doa');
    var response = await http.get(url);
    var data = json.decode(response.body);
    print(data);
  }
}
