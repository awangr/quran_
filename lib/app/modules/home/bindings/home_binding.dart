import 'package:get/get.dart';
import 'package:quran_api/app/modules/home/controllers/home_controller.dart';

class HomequranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
