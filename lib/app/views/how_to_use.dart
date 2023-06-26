import 'package:bismillah_ta/app/controllers/how_to_use_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes.dart';
import '../styles.dart';
import '../utils.dart';

class HowToUse extends GetView<HowToUseController> {
  const HowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    HowToUse() {
      return Column(
        children: [
          SizedBox(
            height: size.height*0.5,
          ),
          Text(
            "How To Use",
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
                RoutePath.howToUse, arguments:{
                "page title":"How To Use"
                }
              );
            },
          ),
        ],
      );
    }


    return GetX(
      tag: "How To Use",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          backgroundColor: Theme.of(context).cardColor,
          body: 
          SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              "How To Use", 
              style: AppTextStyle.primary.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(),
            ],
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