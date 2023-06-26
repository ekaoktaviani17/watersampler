import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController());
  }
}
