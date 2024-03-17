import 'package:get/get.dart';
import 'package:quran_api/app/modules/detail_quran/controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailQuranController>(
      () => DetailQuranController(),
    );
  }
}
