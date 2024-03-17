import 'package:get/get.dart';
import 'package:quran_api/app/modules/home_quran/controllers/home_quran_controller.dart';

class HomequranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeQuranController>(
      () => HomeQuranController(),
    );
  }
}
