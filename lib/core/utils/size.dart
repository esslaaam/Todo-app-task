import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class AppFonts {
  static final double t28 = 28.sp;
  static final double t20 = 20.sp;
  static final double t18 = 18.sp;
  static final double t16 = 16.sp;
  static final double t13 = 13.sp;
}

class AppRadius {
  static final double r38 = 38.r;
  static final double r16 = 16.r;
  static final double r8 = 8.r;
}
