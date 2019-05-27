import 'package:flutter/material.dart';

class Colours {
  static const Color app_main = Color(0xFF666666);

  static const Color transparent_80 = Color(0x80000000); //<!--204-->
  static const Color transparent_00 = Color(0x00000000); //<!--000-->

  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);

  static const Color divider = Color(0xffe5e5e5);

  static const Color gray_33 = Color(0xFF333333); //51
  static const Color gray_66 = Color(0xFF666666); //102
  static const Color gray_99 = Color(0xFF999999); //153
  static const Color common_orange = Color(0XFFFC9153); //252 145 83
  static const Color gray_ef = Color(0XFFEFEFEF); //153

  static const Color gray_f0 = Color(0xfff0f0f0); //<!--204-->
  static const Color gray_f5 = Color(0xfff5f5f5); //<!--204-->
  static const Color gray_cc = Color(0xffcccccc); //<!--204-->
  static const Color gray_ce = Color(0xffcecece); //<!--206-->
  static const Color green_1 = Color(0xff009688); //<!--204-->
  static const Color green_62 = Color(0xff626262); //<!--204-->
  static const Color green_e5 = Color(0xffe5e5e5); //<!--204-->
  static const Color blue_1184fa = Color(0xff1184fa); //<!--204-->
  static const Color green_53B890 = Color(0xff53B890); //<!--204-->
  static const Color color_EAEAEA = Color(0xffEAEAEA); //<!--204-->
  static const Color color_49B2B6 = Color(0xff49B2B6); //<!--204-->
  static const Color color_7DC5CB = Color(0xff7DC5CB); //<!--204-->
  static const Color color_737270 = Color(0xff737270); //<!--204-->
  static const Color color_A2A2A5 = Color(0xffA2A2A5); //<!--204-->
  static const Color color_80CC37 = Color(0xff80CC37); //<!--204-->
  static const Color color_07A73B = Color(0xff07A73B); //<!--204-->
  static const Color color_45A0EF = Color(0xff45A0EF); //<!--204-->

}

Map<String, Color> circleAvatarMap = {
  'A': Colors.blueAccent,
  'B': Colors.blue,
  'C': Colors.cyan,
  'D': Colors.deepPurple,
  'E': Colors.deepPurpleAccent,
  'F': Colors.blue,
  'G': Colors.green,
  'H': Colors.lightBlue,
  'I': Colors.indigo,
  'J': Colors.blue,
  'K': Colors.blue,
  'L': Colors.lightGreen,
  'M': Colors.blue,
  'N': Colors.brown,
  'O': Colors.orange,
  'P': Colors.purple,
  'Q': Colors.black,
  'R': Colors.red,
  'S': Colors.blue,
  'T': Colors.teal,
  'U': Colors.purpleAccent,
  'V': Colors.black,
  'W': Colors.brown,
  'X': Colors.blue,
  'Y': Colors.yellow,
  'Z': Colors.grey,
  '#': Colors.blue,
};

Map<String, Color> themeColorMap = {
  'gray': Colours.gray_33,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.deepOrange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};
