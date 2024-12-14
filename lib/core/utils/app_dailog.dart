import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppDialog {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).hintColor,
              ),
              Gap(10.w),
              Text(
                message,
                style: AppTextStyle.textStyle22CP.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text(
                'ok',
                style: AppTextStyle.textStyle22CP.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            )
          ],
          title: Icon(
            Icons.warning_amber,
            color: AppColor.redColor,
            size: 30.sp,
          ),
          content: Text(
            message,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textStyle16CP.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      width: 300.w,
      duration: const Duration(milliseconds: 300),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
