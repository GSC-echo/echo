import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundColor {
  static const Color background1 = Color(0xffF5F5F5);
  static const Color mainGreen = Color(0xFF5DCA75);
}

class TextStyles {
  static TextStyle h1 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F1A20)
  );
  static TextStyle h2 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F1A20)
  );
  static TextStyle h3 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F1A20).withOpacity(0.8),
  );
  static TextStyle white1 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle white2 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle green = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: BackgroundColor.mainGreen,
  );
  static Color echoYellow = Color(0xFF0F6AE2D);
  static Color echoNavy = Color(0xFF0F1A20);
}
