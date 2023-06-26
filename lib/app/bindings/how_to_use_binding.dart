import 'package:get/get.dart';

import '../controllers/how_to_use_controller.dart';

class HowToUseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HowToUseController());
  }
}