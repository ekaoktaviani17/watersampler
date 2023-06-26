import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/bluetooth_connect_controller.dart';
import '../styles.dart';
import '../utils.dart';

class BluetootConnect extends GetView<BluetoothConnectController> {
  const BluetootConnect({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bluetoothConnector() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Penghubung Bluetooth",
              style: AppTextStyle.primary.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20, ),
              width: size.width*1,
              height: size.height*0.05,
              decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 3,
              offset: Offset.fromDirection(-5, -5),
              ),
              ],
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      controller.bluetoothState.value == BluetoothState.STATE_ON
                          ? Icons.bluetooth_connected_rounded
                          : Icons.bluetooth_disabled_rounded,
                      color: controller.bluetoothState.value ==
                              BluetoothState.STATE_ON
                          ? AppColor.green
                          : AppColor.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bluetooth",
                      style: AppTextStyle.primary.copyWith( //copywith untuk menambahkan file yang sudah tersedia
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Switch( //untuk ui toggle non off bluetooth
                  thumbIcon: controller.thumbIcon,
                  value: controller.bluetoothState.value ==
                      BluetoothState.STATE_ON,
                  trackOutlineColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent,
                  ),
                  inactiveThumbColor: AppColor.secondary,
                  activeTrackColor: AppColor.green,
                  inactiveTrackColor: AppColor.red,
                  onChanged: (bool value) async {
                    await controller.togleActiveBluetooth();
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    bluetoothDeviceCard(BluetoothDevice device) { //untuk menampulkan ui card list devices
      return Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Row(
            children: [
              Expanded( //untuk memaksimalkan atau menampilkan view pada bagian bluetooth devices 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      device.name ?? "", //karena device.name nya itu bisa jadi null value jadi harus aja penjagaan nullsafety seperty ??
                      style: AppTextStyle.primary,
                    ),
                    Text(
                      device.address,
                      style: AppTextStyle.primary,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (device.isConnected) {
                    controller.disconnect(device);
                  } else {
                    controller.connect(device);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) =>
                        device.isConnected ? AppColor.red : AppColor.green,
                  ),
                ),
                child: Icon(
                  device.isConnected ? Icons.link_off_sharp : Icons.link_sharp,
                  color: AppColor.secondary,
                ),
              )
            ],
          ),
        ),
      );
    }

    bluetoothDevices() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 4,
          mainAxisSpacing: 5,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          children: controller.devices
              .map((device) => bluetoothDeviceCard(device))
              .toList(),
        ),
      );
    }

    return GetX(
      tag: controller.pageTitle.value,
      init: controller, //penginisilisasian di dalam controller 
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return WillPopScope(
          onWillPop: () async {
            // bisa menambahkan kode berikut di action icon back
            Get.back(
              result: controller.SelectedDevice.value,
            );
            // end
            return false;
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: controller.pageTitle.value,
              titleStyle: AppTextStyle.secondary,
              backgroundColor: AppColor.darkBlue,
              iconColor: AppColor.secondary,
              result: controller.SelectedDevice.value,
            ),
            body: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/bg.png"),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Column(
                children: [
                  bluetoothConnector(),
                  const SizedBox(
                    height: 30,
                  ),
                  bluetoothDevices(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}