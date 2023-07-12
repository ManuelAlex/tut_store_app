import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = "#ED9728".stringToColor();
  static Color darkGrey = "#525252".stringToColor();
  static Color grey = "#737477".stringToColor();
  static Color lightGrey = "#9E9E9E".stringToColor();
  static Color primaryOpacity70 = "#B3ED9728".stringToColor();

  static Color darkPrimary = "#d17d11".stringToColor();
  static Color grey1 = "#707070".stringToColor();
  static Color grey2 = "#797979".stringToColor();
  static Color white = "#FFFFFF".stringToColor();
  static Color error = "#e61f34".stringToColor();
  static Color black = "#000000".stringToColor(); // red color
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

extension StringToColor on String {
  Color stringToColor() => Color(
        int.parse(
          replaceString(),
          radix: 16,
        ),
      );
}

extension ReplaceString on String {
  String replaceString() {
    String str = replaceAll('#', '');
    if (str.length == 6) {
      return "ff$str";
    } else if (str.length == 8) {
      return str;
    }
    throw Exception('Incomplete Color String');
  }
}
