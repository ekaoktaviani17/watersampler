// import 'package:bismillah_ta/app/views/niskin_dalam.dart';
import 'package:bismillah_ta/app/views/How_To_Use.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/bluetooth_connect_binding.dart';
import 'bindings/botol_niskin_binding.dart';
import 'bindings/botol_sensor_binding.dart';
import 'bindings/homepage_binding.dart';
import 'bindings/how_to_use_binding.dart';
import 'views/bluetooth_connect.dart';
import 'views/botol_niskin.dart';
import 'views/botol_sensor.dart';
import 'views/homepage.dart';


abstract class RoutePath {
  static String homepage = "/";
  static String botolNiskin = "/botol-niskin";
  static String botolSensor = "/botol-sensor";
  static String bluetoothConnect = "/bluetooth-connect";
  static String howToUse = "/how-to-use";
}

class AppRoute implements RoutePath {
  static final pages = [
    GetPage(
      name: RoutePath.homepage,
      page: () => const Homepage(),
      binding: HomepageBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.botolNiskin,
      page: () => const BotolNiskin(),
      binding: BotolNiskinBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.botolSensor,
      page: () => const BotolSensor(),
      binding: BotolSensorBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.bluetoothConnect,
      page: () => const BluetootConnect(),
      binding: BluetoothConnectBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
      GetPage(
      name: RoutePath.howToUse,
      page: () => const HowToUse(),
      binding: HowToUseBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
