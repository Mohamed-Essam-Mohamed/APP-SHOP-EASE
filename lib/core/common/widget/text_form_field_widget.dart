import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.validator,
      required this.controller});
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle22CP,
        ),
        Gap(10.h),
        TextFormField(
          textDirection: TextDirection.ltr,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.cairo(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
            focusedBorder: _outlineInputBorder(context, null),
            enabledBorder: _outlineInputBorder(context, null),
            errorBorder: _outlineInputBorder(context, AppColor.redColor),
            focusedErrorBorder: _outlineInputBorder(context, AppColor.redColor),
          ),
        )
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context, Color? color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: color ?? Theme.of(context).primaryColor,
        width: 1,
      ),
    );
  }
}
