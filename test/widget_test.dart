import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio();
void main() async {
  var res = await dio.get(
      'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json');
  var data = jsonDecode(res.data);
  print('/////////////// Q U R A N \\\\\\\\\\\\');
  print(data.toString());
  var resSurah = await dio.get(
      'https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/1.json');
  var dataSurah = jsonDecode(resSurah.data);
  print('/////////////// S U R A H \\\\\\\\\\\\');
  print(dataSurah);
}
