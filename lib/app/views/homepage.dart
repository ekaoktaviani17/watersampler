import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';
import '../routes.dart';
import '../styles.dart';
import '../utils.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    botolNiskinButton() {
      return InkWell(
        onTap: () {
        Get.toNamed(RoutePath.botolNiskin);
        },
        child: Container(
          width: size.width * 0.4,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.080),
            color: AppColor.teal,
              boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset.fromDirection(-8, -2),
            )
            ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 200,
                    color: AppColor.secondary,
                    child: Image.asset(
                      'assets/niskin.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('Botol Niskin'),
                  )
                ],
              ),
            ),
        ),
      );
    }

    botolSensorButton() {
      return InkWell(
        onTap: () {
          Get.toNamed(RoutePath.botolSensor);
        },
        child: Container(
          width: size.width * 0.4,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.080),
            color: AppColor.teal,
              boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset.fromDirection(-8, -2),
            )
            ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 200,
                    color: AppColor.secondary,
                    child: Image.asset(
                      'assets/BotolSensor.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('Botol Sensor'),
                  )
                ],
              ),
            ),
        ),
      );
    }

    howToUseButton() {
      return InkWell(
        onTap: () {
          Get.toNamed(RoutePath.howToUse);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 4, bottom: 0, left: 0, right: 6, ),
              width: size.width*0.35,
              height: size.height*0.05,
              decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
              color: AppColor.primary,
              width: 1.0, )),
              ), 
            child: ClipRRect(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('How To Use',),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
            ),
            ),
            
          ],
        ),
      );
    }

    return GetX(
      tag: "Homepage",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          body: 
          SafeArea(
          child: SizedBox(
              width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                padding: const EdgeInsets.only(top: 40, bottom: 0, left: 30, right: 30, ),
                height: size.height*0.1,
                decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.vertical(bottom:Radius.circular(20)),
              boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 2,
              offset: Offset.fromDirection(-20, -7),
              ),
              ],
              ),
            child: Center(
              child: Text(
                "Water Sampler Aplications", 
                style: AppTextStyle.primary.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top:50),
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                                "Pilih Pengaturan Botol:",
                                style: AppTextStyle.primary.copyWith(
                                fontSize: 20,
                                ),
                              ),
                          SizedBox(
                            height: size.height*0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              botolNiskinButton(),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              botolSensorButton(),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              howToUseButton(),
                              SizedBox(
                                height: size.height * 0.10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                ),
              ],
            ),
          )
          ),
          );
      },
    );
  }
}
