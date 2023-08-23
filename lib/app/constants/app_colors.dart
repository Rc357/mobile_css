import 'package:flutter/material.dart';

class AppColors {
  static const Color lBlue = Color.fromARGB(255, 125, 137, 250);
  static const Color orange = Color(0xFFF7941D);
  static const Color blue = Color.fromARGB(255, 106, 45, 175);
  static const Color red = Color(0xFFF26522);

  static const Map<int, Color> _orangeColorMap = {
    50: Color.fromRGBO(247, 148, 29, .1),
    100: Color.fromRGBO(247, 148, 29, .2),
    200: Color.fromRGBO(247, 148, 29, .3),
    300: Color.fromRGBO(247, 148, 29, .4),
    400: Color.fromRGBO(247, 148, 29, .5),
    500: Color.fromRGBO(247, 148, 29, .6),
    600: Color.fromRGBO(247, 148, 29, .7),
    700: Color.fromRGBO(247, 148, 29, .8),
    800: Color.fromRGBO(247, 148, 29, .9),
    900: Color.fromRGBO(247, 148, 29, 1),
  };

  // material orange
  static const MaterialColor materialOrange =
      MaterialColor(0xFFF7941D, _orangeColorMap);

  static const hexfcfcfc = Color(0XFFFCFCFC);
  static const hex242424 = Color(0xFF242424);

  static const hexe6e6e6 = Color(0XFFE6E6E6);
  static const hex707070 = Color(0xFF707070);

  static const hex979797 = Color(0xFF979797);
  static const hexd8d8d8 = Color(0xFFD8D8D8);

  static const hexf1f1f1 = Color(0xFFF1F1F1);
  static const hex939393 = Color(0xFF939393);

  static const hexcbcbcb = Color(0xFFCBCBCB);

  static final greyWithOpacity = Colors.grey.withOpacity(0.4);

  static final highlightColor = Colors.grey.withOpacity(0.3);
  static final splashColor = Colors.white.withOpacity(0.3);

  static final shimmerBaseColor = Colors.grey.shade400;
  static final shimmerHighlightColor = Colors.grey.shade100;
}
