import 'package:flutter/material.dart';

class ColorHelper {
  static Color getColorFromColorCode(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  static Color? stringToColor(String? hexColor) {
    hexColor = hexColor?.replaceAll("#", "").trim();
    if (hexColor == null || hexColor.length < 3) return null;

    for (int i = hexColor.length; i < 6; i++) hexColor = "F$hexColor";

    hexColor = "0xFF${hexColor.toString()}";

    final int? color = int.tryParse("$hexColor");
    if (color == null) return null;
    return Color(color);
  }
}
