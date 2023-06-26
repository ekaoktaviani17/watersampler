import 'dart:typed_data';

import 'package:bismillah_ta/app/utils.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BotolSensorController extends GetxController {
  final pageTitle = RxString("Homepage");
  final bluetoothConnection = Rxn<BluetoothConnection>();

  @override
  void onInit() {
    receiveData();
    super.onInit();
  }

  receiveData() {
    if (bluetoothConnection.value != null) {
      bluetoothConnection.value?.input?.listen((data) {
        int backspacesCounter = 0;
        for (var byte in data) {
          if (byte == 8 || byte == 127) {
            backspacesCounter++;
          }
        }
        Uint8List buffer = Uint8List(data.length - backspacesCounter);
        int bufferIndex = buffer.length;

        // Apply backspace control character
        backspacesCounter = 0;
        for (int i = data.length - 1; i >= 0; i--) {
          if (data[i] == 8 || data[i] == 127) {
            backspacesCounter++;
          } else {
            if (backspacesCounter > 0) {
              backspacesCounter--;
            } else {
              buffer[--bufferIndex] = data[i];
            }
          }
        }

        // Create message if there is new line character
        String dataString = String.fromCharCodes(buffer);

        utils.println(dataString);
      });
    }
  }

  sendCommand() async {
    if (bluetoothConnection.value != null) {
      bluetoothConnection.value?.output.add(utils.generateUintFromText("1"));
      await bluetoothConnection.value?.output.allSent;
    }
  }
}