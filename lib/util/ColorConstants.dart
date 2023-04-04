import 'package:flutter/material.dart';

class ColorConstants {
  static Color white = hexToColor('#ffffff');
  static Color black = hexToColor('#000000');
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray500 = hexToColor('#242526');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color gray800 = hexToColor('#121313');
  static Color gray900 = hexToColor('#0e0f0f');
  static Color earningColor = hexToColor('#467DBE');
  static Color orangeColor = hexToColor('#F39834');
  static Color appColor = hexToColor('#02385F');
  static Color appDarkColor = Color(0xFF181A36);
  static Color appColorbg = hexToColor('#F2F5F9');
  static Color appSecond = hexToColor('#B194FF');
  static Color download = hexToColor('#F58120');
  static Color floatbtn = hexToColor('#22B2E8');
  static Color yellow = hexToColor('#FFEDC0');
  static Color green = hexToColor('#77CFA0');
  static Color red = hexToColor('#F66769');
  static Color color1 = hexToColor('#003B63');
  static Color color2 = hexToColor('#181A36');


  static Color selectedColor = hexToColor('#FFC73D');
  static Color drawerBackgroundColor = hexToColor('#2F1C60');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}

TextStyle listTitleDefaultTextStyle = TextStyle(
    color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle =
    TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

