import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import '../../../model/all_surah.dart';
import '../../home_quran/controllers/home_quran_controller.dart';

class MurotalController extends GetxController {
  final player = AudioPlayer();
  RxString audition = 'stop'.obs;
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

  void playSurah(String? url) async {
    if (url != null) {
      // Catching errors at load time
      try {
        await player.stop();
        await player.setUrl(url);
        audition.value = 'play';
        await player.play();
        audition.value = 'stop';
        await player.stop();
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

  void resumeSurah() async {
    try {
      audition.value = 'play';
      await player.play();
      audition.value = 'stop';
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

  void pauseSurah() async {
    try {
      await player.pause();
      audition.value = 'pause';
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

  void stopSurah() async {
    try {
      await player.stop();
      audition.value = 'stop';
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

  /// Ini cara agar player terdispose dan stop pada saat button back
  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
