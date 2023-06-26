import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../utils.dart';

class BotolNiskinController extends GetxController {
  final pageTitle = RxString("Homepage");
  final bluetoothConnection = Rxn<BluetoothConnection>();
  final inputController = TextEditingController();
  // ignore: non_constant_identifier_names
  final toggle_button_status = [true, false];

  @override
  void onInit() {
    receiveData();
    super.onInit();
  }



  initBluetooth(BluetoothDevice toConnectDevice) async {
    await BluetoothConnection.toAddress(toConnectDevice.address)
        .then((connection) {
      bluetoothConnection.value = connection;
      receiveData();
    }).catchError((error) {
      print(error);
    });
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

  sendCommand(String command) async {
    if (bluetoothConnection.value != null) {
      bluetoothConnection.value?.output.add(utils.generateUintFromText(command));
      await bluetoothConnection.value?.output.allSent;
    }
  }
}