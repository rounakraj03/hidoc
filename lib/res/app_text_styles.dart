import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle headline1 = const TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headline2 = const TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle body1 = const TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body2 = const TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subtitle1 = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  // static TextStyle webHeading1 = const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14);
  // static TextStyle webSubheading1 = const TextStyle(color: Colors.black,fontWeight: FontWeight.normal, fontSize: 12);

  static TextStyle webHeading = const TextStyle(fontWeight: FontWeight.w800,fontSize: 28);
  // static TextStyle webHeading = GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 28);
  static TextStyle white16 = const TextStyle(color: Colors.white,fontSize: 16);
  static TextStyle black16w500 = const TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle white18 = const TextStyle(color: Colors.white,fontSize: 18);
  static TextStyle white12 = const TextStyle(color: Colors.white,fontSize: 12);
  static TextStyle white14 = const TextStyle(color: Colors.white,fontSize: 14);
  static TextStyle cyan16 = const TextStyle(color: Colors.cyan,fontSize: 16);
}
