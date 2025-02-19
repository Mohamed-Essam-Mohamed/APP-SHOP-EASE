import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.isSecureText,
    this.fontSize,
    this.onChanged,
  });
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double? fontSize;
  bool? isSecureText;
  void Function(String)? onChanged;
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyle.textStyle22CP.copyWith(
            fontSize: widget.fontSize,
          ),
        ),
        Gap(6.h),
        TextFormField(
          textDirection: TextDirection.ltr,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isSecureText ?? false,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: _secureIcon(),
            hintText: widget.hintText,
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

  Widget? _secureIcon() {
    return widget.isSecureText != null
        ? GestureDetector(
            onTap: () {
              setState(() {
                widget.isSecureText = !widget.isSecureText!;
              });
            },
            child: widget.isSecureText == false
                ? const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColor.grayAppColor,
                  )
                : const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColor.grayAppColor,
                  ),
          )
        : null;
  }
}
