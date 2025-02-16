import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  static void showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: child,
          ),
        );
      },
    ).whenComplete(onTap ?? () {});
  }
}
