import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColor.primaryColor,
    canvasColor: AppColor.secondaryColor,
    hintColor: AppColor.grayColor,
    scaffoldBackgroundColor: AppColor.secondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.secondaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor, size: 30),
      titleTextStyle: GoogleFonts.cairo(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: AppColor.primaryColor,
      ),
    ),
  );
}
