
import 'dart:convert';

import 'package:bismillah_ta/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../styles.dart';

class BluetoothConnectController extends GetxController {
  final pageTitle = RxString("Bluetooth"); //variable getx
  final bluetoothState = Rxn<BluetoothState>(); //untuk mengecek bluetooth aktif atau tidak
  final bluetooth = Rx<FlutterBluetoothSerial>(FlutterBluetoothSerial.instance); //Untuk mengambil state bluetooth yang sedang digunakan saat ini
  final bluetoothConnection = Rxn<BluetoothConnection>(); //untuk mengirim perintah ke arduino 
  final SelectedDevice = Rxn<BluetoothDevice>();
  final devices = RxList<BluetoothDevice>();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Icon(
          Icons.check,
          color: AppColor.green,
        );
      }
      return Icon(
        Icons.close,
        color: AppColor.red,
      );
    },
  );
  final MaterialStateProperty<Color?> thumbColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColor.green;
      }
      return AppColor.red;
    },
  );

  @override
  void onInit() {
    initialStateOfBluetooth(); //method untuk mengecek pertama kali buka page bluetooth on atau off 
    super.onInit(); 
  }

  initialStateOfBluetooth() async {
    bluetoothState.value = await FlutterBluetoothSerial.instance.state;
    if (bluetoothState.value == BluetoothState.STATE_ON) {
      await getPairedDevices();
    }
    update();
  }

  Future<void> togleActiveBluetooth() async {
    try {
      if (bluetoothState.value == BluetoothState.STATE_OFF) {
        await FlutterBluetoothSerial.instance.requestEnable().then((value) {
          bluetoothState.value = BluetoothState.STATE_ON;
        });
        await getPairedDevices();
      } else {
        await FlutterBluetoothSerial.instance.requestDisable().then((value) {
          bluetoothState.value = BluetoothState.STATE_OFF;
        });
        devices.value = []; 
      }
    } catch (e) { //Untuk mengecek terjadi error atau tidaknya
      rethrow;
    }
    update();
  }

  Future<void> getPairedDevices() async { //untuk mengambil list bluetooth device
    try {
      devices.value = await bluetooth.value.getBondedDevices();
    } on PlatformException {
      utils.println("Error"); 
      }
  }

  connect(BluetoothDevice toConnectDevice) async {
    await BluetoothConnection.toAddress(toConnectDevice.address)
        .then((connection) {
      SelectedDevice.value = toConnectDevice;
      bluetoothConnection.value = connection;
      bluetoothConnection.value?.input?.listen(null).onDone(() {});
    }).catchError((error) async{
      SelectedDevice.value = null;
      bluetoothConnection.value = null;
      print(error);
    });
    await getPairedDevices();
  }

  Future <void> _sendData(String data) async {
  var connection;
  connection.output.add(utf8.encode(data + "\r\n"));
  await connection.output.allSent;
}

Future <void> _listenToData() async {
  var connection;
  connection.input.listen((data) {
    // Proses data yang diterima dari Arduino di sini
    String message = utf8.decode(data);
    print(message);
  });
}

  Future<void> connectToDevice(BluetoothDevice device) async {
  // ignore: unused_local_variable
  BluetoothConnection connection = await BluetoothConnection.toAddress(device.address);
}

  void disconnect(BluetoothDevice device) {}
}