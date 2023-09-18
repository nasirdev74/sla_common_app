import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xFFF7691F);
  static const primary01 = Color(0xFFF1F2FF);
  static const primary02 = Color(0xFFCFD3E6);
  static const primary04 = Color(0xFFAAB0D7);
  static const primary06 = Color(0xFF848EC9);
  static const primary08 = Color(0xFF5F6BBA);

  static const secondary = Color(0xFFFD0003);
  static const secondary08 = Color(0xFFFE3435);
  static const secondary06 = Color(0xFFFE6767);
  static const secondary04 = Color(0xFFFF999A);
  static const secondary02 = Color(0xFFFECCCC);
  static const secondary01 = Color(0xFFFFE5E6);

  static const tertiary = Color(0xFF1B3364);
  static const tertiary01 = Color(0xFFE8EBEF);
  static const tertiary02 = Color(0xFFD1D6E0);
  static const tertiary04 = Color(0xFFA4ADC1);
  static const tertiary06 = Color(0xFF7685A2);
  static const tertiary08 = Color(0xFF495C83);

  static const black = Color(0xFF040415);
  static const black08 = Color(0xFF363644);
  static const black06 = Color(0xFF686873);
  static const black04 = Color(0xFF9B9BA1);
  static const black02 = Color(0xFFCDCDD0);
  static const black01 = Color(0xFFE6E6E8);

  static const quaternary = Color(0xFF040415);
  static const inputBackground = Color(0xFFF4F6FE);
  static const tabBackground = Color(0xFFF4F6FE);
  static const errorColor = Color(0xFFFE0002);
  static const splashBackground = Color(0xFF313A45);
  static const scaffoldBackgroundA = Color(0xFFF7F9FA);

  static const FFFFFF = Color(0xFFFFFFFF);

  static const FFFF5700 = Color(0xFFFF5700);
  static const FFAE3C00 = Color(0xFFAE3C00);
  static const FFF7691F = Color(0xFFF7691F);
  static const FFFFA500 = Color(0xFFFFA500);
  static const FFC27E00 = Color(0xFFC27E00);
  static const FF000000 = Color(0xFF000000);
  static const FF0C0D17 = Color(0xFF0C0D17);
  static const FF222222 = Color(0xFF222222);
  static const FF545454 = Color(0xFF545454);
  static const FF8E8E8E = Color(0xFF8E8E8E);
  static const FFDFE1E4 = Color(0xFFDFE1E4);
  static const FFF0F0F0 = Color(0xFFF0F0F0);
  static const FF4CAF50 = Color(0xFF4CAF50);
  static const FFCED2DA = Color(0xFFCED2DA);
  static const FFF66C1F = Color(0xFFF66C1F);
  static const FFEFB124 = Color(0xFFEFB124);
  static const FFDADADA = Color(0xFFDADADA);
  static const D9D9D900 = Color(0xFFD9D9D9);
  static const FFF4EEEA = Color(0xFFF4EEEA);
  static const FFFEEEE3 = Color(0xFFFEEEE3);
  static const FFF0E6E0 = Color(0xFFF0E6E0);
  static const FFEEE7DB = Color(0xFFEEE7DB);
  static const FFB7B7B9 = Color(0xFFB7B7B9);
  static const FFF7F7F7 = Color(0xFFF7F7F7);
  static const FFFF3D00 = Color(0xFFFF3D00);
  static const FF3C3C41 = Color(0xFF3C3C41);

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
