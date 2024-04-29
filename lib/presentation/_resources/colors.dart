import 'package:flutter/material.dart';

class MyColors {
  static Color primary = HexColor.fromHex("#4FC3F7");
  static Color backgroundGradient = HexColor.fromHex('#33FFA726');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
