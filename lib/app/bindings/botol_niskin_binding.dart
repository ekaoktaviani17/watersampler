import 'package:get/get.dart';

import '../controllers/botol_niskin_controller.dart';

class BotolNiskinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BotolNiskinController());
  }
}
