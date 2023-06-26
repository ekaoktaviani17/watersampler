import 'dart:convert';
import 'package:flutter/foundation.dart';

class Utils {
  println(dynamic data) {
    if (kDebugMode) {
      print(data);
    }
  }

  generateUintFromText(String text) {
    return Uint8List.fromList(utf8.encode("$text\r\n"));
  }
}

Utils utils = Utils();
