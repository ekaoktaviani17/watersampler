import 'package:get/get.dart';

import '../controllers/bluetooth_connect_controller.dart';

class BluetoothConnectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BluetoothConnectController());
  }
}