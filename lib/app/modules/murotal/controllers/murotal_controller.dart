import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import '../../../model/all_surah.dart';
import '../../home_quran/controllers/home_quran_controller.dart';

class MurotalController extends GetxController {
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

  final player = AudioPlayer();
  void playSurah(String? url) async {
    if (url != null) {
      // Catching errors at load time
      try {
        await player.setUrl(url);
        await player.play();
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: '${e.message.toString()}');
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Connection aborted: ${e.message}');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: 'An error occured: $e');
      }
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
