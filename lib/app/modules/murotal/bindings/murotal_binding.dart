import 'package:get/get.dart';

import '../controllers/murotal_controller.dart';

class MurotalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MurotalController>(
      () => MurotalController(),
    );
  }
}
