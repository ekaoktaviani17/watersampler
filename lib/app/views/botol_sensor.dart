import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/botol_sensor_controller.dart';
import '../routes.dart';
import '../styles.dart';
import '../utils.dart';

class BotolSensor extends GetView<BotolSensorController> {
  const BotolSensor({super.key});

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
            onTap: () {
              Get.toNamed(
                RoutePath.bluetoothConnect, arguments:{
                "page title":"Botol Sensor"
                }
              );
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

    unduhData() {
      return Column(
        children: [
          Text(
            "Unduh Data",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Unduh",
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
      tag: "Botol Sensor",
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
              "Botol Sensor", 
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
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Column(
                    children: [
                    blueToothConnector(),
                  const SizedBox(
                    height: 15,
                  ),
                  unduhData(),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ],
                      // end
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
