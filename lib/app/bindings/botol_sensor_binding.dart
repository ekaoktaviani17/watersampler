import 'package:get/get.dart';

import '../controllers/botol_sensor_controller.dart';

class BotolSensorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BotolSensorController());
  }
}
