import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_text_style.dart';

class ButtonAppWidget extends StatelessWidget {
  const ButtonAppWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isFilled = true,
  });
  final void Function()? onPressed;
  final String title;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(
          color: AppColor.primaryColor,
        ),
      ),
      color: isFilled ? AppColor.primaryColor : AppColor.secondaryColor,
      child: Text(
        title,
        style: AppTextStyle.textStyle16CP.copyWith(
            color: isFilled ? AppColor.secondaryColor : AppColor.primaryColor),
      ),
    );
  }
}
