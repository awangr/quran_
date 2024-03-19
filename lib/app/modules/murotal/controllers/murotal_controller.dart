import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
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
  void playSurah(AllSurah? surah) async {
    if (surah?.audio != null) {
      // Catching errors at load time
      try {
        // await player.stop();
        surah!.condition = 'play';
        print(surah.condition);

        await player.setUrl(surah.audio!);

        await player.play();
        print(surah.condition);
        refresh();
        surah.condition = 'stop';
        await player.stop();
        refresh();
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

  void resumeSurah(AllSurah? surah) async {
    try {
      surah?.condition = 'play';
      await player.play();
      refresh();
      surah?.condition = 'stop';
      refresh();
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

  void pauseSurah(AllSurah surah) async {
    try {
      await player.pause();
      surah.condition = 'pause';
      refresh();
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

  void stopSurah(AllSurah surah) async {
    try {
      await player.stop();
      surah.condition = 'stop';
      refresh();
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
