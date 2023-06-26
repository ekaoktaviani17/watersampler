import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/botol_niskin_controller.dart';
import '../routes.dart';
import '../styles.dart';
import '../utils.dart';

class BotolNiskin extends GetView<BotolNiskinController> {
  const BotolNiskin({super.key}); 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    blueToothConnector() {
      return Column(
        children: [
          SizedBox(
            height: size.height*0.02,
          ),
          Text(
            "Penghubung Bluetooth",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.width * 0.04,
          ),
          InkWell(
            onTap: () async {
                var connection = await Get.toNamed(
                  RoutePath.bluetoothConnect,
                );
                if(connection != null) {
                  print(connection);
                  controller.initBluetooth(connection);
                  controller.update();
                }
            },
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 8, left: 0, right: 80, ),
              width: size.width*1,
              height: size.height*0.05,
              decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
              color: AppColor.primary,
              width: 3.0, )),
              ),
              child: SizedBox(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.bluetooth,
                            color: AppColor.primary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tampilkan Bluetooth",
                            style: AppTextStyle.primary.copyWith(
                            fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    controlTutupBotol() {
      return Column(
        children: [
          Text(
            "Kontrol Tutup Botol Niskin",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.sendCommand("1");
                },
                child: Text(
                  "Buka",
                  style: AppTextStyle.primary.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.green,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.sendCommand("0");
                },
                child: Text(
                  "Tutup",
                  style: AppTextStyle.primary.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    inputKedalaman() {
      return Column(
        children: [
          Text(
            "Input Kedalaman",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.04,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.secondary,
                  boxShadow: [BoxShadow(
                  color: AppColor.primary,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                  offset: Offset.fromDirection(-9, -3),
                )
                ],
                ),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              controller.sendCommand(controller.inputController.text);
            },
            child: Text(
              "Input",
              style: AppTextStyle.primary.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    return GetX(
      tag: "Botol Niskin",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          backgroundColor: Theme.of(context).cardColor,
          body: 
          SafeArea(
          child: Column(
            children: [
              Container(
              padding: const EdgeInsets.only(top: 20, bottom: 15, left: 30, right: 30, ),
              height: size.height*0.07,
              decoration: BoxDecoration(
              color: AppColor.blue,
            boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset.fromDirection(-20, -7),
            ),
            ],
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back),
              ),
              Text(
              "Botol Niskin", 
              style: AppTextStyle.primary.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(),
            ],
          ),
              ),
              Expanded(
                child: Container(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Column(
                    children: [
                    blueToothConnector(),
                  const SizedBox(
                    height: 15,
                  ),
                  controlTutupBotol(),
                  inputKedalaman()
                  
                ],
              ),
            ],
              ),
              ),
              ),
            ],
          )
            ),
          );
      },
    );
  }
}
