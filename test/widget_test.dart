import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final dio = Dio();
void main() async {
  // var res = await dio.get(
  //     'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json');
  // var data = res.data;
  // print('/////////////// Q U R A N \\\\\\\\\\\\');
  // print(data.toString());
  // var resSurah = await dio.get(
  //     'https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/1.json');
  // var dataSurah = resSurah.data;
  // print('/////////////// S U R A H \\\\\\\\\\\\');
  // print(dataSurah);
  // var res = await dio.get('https://api.npoint.io/99c279bb173a6e28359c/data');
  // var data = res.data;
  // print(data);
  ///////////////////////////////////
  // var res = await dio.get('https://equran.id/api/v2/surat');
  // var data = res.data;
  // print(data);

  // try {
  //   var response = await dio.get('https://quran-api-id.vercel.app/surahs');
  //   var data = response.data as List<dynamic>;
  //   print(data);
  // } catch (e) {
  //   print('Error $e');
  // }
  // var res = await http.get(Uri.parse('https://reqres.in/api/users/2'));
  // var data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  // print(data);
  // var res = await http.get(Uri.parse('https://reqres.in/api/users/2'));
  // var data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  // print(data);
  // var res = await http.get(Uri.parse('https://quran-api-id.vercel.app/surahs'));
  // List? data = json.decode(res.body);
  // print(data![1]);
  // try {
  //   var response =
  //       await dio.get('https://doa-doa-api-ahmadramadhan.fly.dev/api');
  //   var data = response.data;
  //   print(data);
  // } catch (e) {
  //   print('ERROR $e');
  // }
}
