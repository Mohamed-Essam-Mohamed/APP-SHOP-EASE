import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/icons/icon-internet.png",
            width: 180.w,
            height: 180.h,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
          ),
          Gap(15.h),
          Text(
            "No Internet Connection",
            textAlign: TextAlign.center,
            style: AppTextStyle.bodySmall,
          ),
          Gap(10.h),
          Text(
            "Please check your network connection and \ntry it agian",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
