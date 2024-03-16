import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_api/app/model/doa.dart';
import 'package:http/http.dart' as http;

class DoaController extends GetxController {
  Future<List<Sholat>> getAllData() async {
    Uri url = Uri.parse(
        'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json');
    var response = await http.get(url);
    List? data = json.decode(response.body);
    print(data);
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Sholat.fromJson(e)).toList();
    }
  }
  // Future<List<Sholat>> getAllData() async {
  //   final dio = Dio();
  //   try {
  //     var response = await dio.get(
  //         'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json');
  //     List<dynamic> resData = response.data;
  //     List<Sholat> dataList = resData.map((e) => Sholat.fromJson(e)).toList();
  //     return dataList;
  //     // var response = await dio.get(
  //     //     'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json');
  //     // print(response);
  //     // return (response.data as List<dynamic>)
  //     //     .map((e) => Sholat.fromJson(e))
  //     //     .toList();
  //   } catch (err) {
  //     throw Exception('ERRROR');
  //   }
  // }
}
