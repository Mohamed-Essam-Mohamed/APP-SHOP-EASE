import 'dart:io';

import 'package:app_shop_ease/core/common/widget/custom_bottom_sheet.dart';
import 'package:app_shop_ease/core/common/widget/text_form_field_widget.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/common/widget/button_app_widget.dart';

class AddCategorySection extends StatelessWidget {
  const AddCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Add New Category", style: AppTextStyle.textStyle20CP),
        // const Spacer(),
        ButtonAppWidget(
          onPressed: () {
            CustomBottomSheet.showCustomBottomSheet(
              backgroundColor: AppColor.secondaryColor,
              context: context,
              child: BottomSheetCategory(
                title: "Add Category",
                titlePhoto: "Add a photo",
                hintText: "Category Name",
                label: "Enter the Category Name",
                controller: TextEditingController(),
                validator: (value) => null,
                titleButton: "Create a new category",
                onPressedButton: () {},
              ),
            );
          },
          title: "Add",
          minWidth: 100,
        ),
      ],
    );
  }
}

class BottomSheetCategory extends StatelessWidget {
  const BottomSheetCategory({
    super.key,
    required this.title,
    required this.controller,
    this.image,
    required this.hintText,
    required this.validator,
    required this.label,
    required this.onPressedButton,
    required this.titleButton,
    required this.titlePhoto,
  });
  final String title;
  final String label;
  final String titlePhoto;
  final String hintText;
  final String? Function(String?)? validator;
  final String titleButton;
  final void Function()? onPressedButton;
  final TextEditingController controller;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle20CP.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(10.h),
        Text(titlePhoto, style: AppTextStyle.textStyle18CP),
        Gap(5.h),
        InkWell(
          onTap: () {},
          child: Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.grayColor,
            ),
            child: image == null
                ? Icon(
                    Icons.add_a_photo_outlined,
                    size: 80.sp,
                    color: AppColor.grayAppColor,
                  )
                : Image.file(
                    File(image!.path),
                    fit: BoxFit.fitWidth,
                  ),
          ),
        ),
        Gap(10.h),
        TextFormFieldWidget(
          title: label,
          hintText: hintText,
          validator: validator,
          controller: controller,
          fontSize: 18.sp,
        ),
        Gap(10.h),
        ButtonAppWidget(
          title: titleButton,
          minWidth: double.infinity,
          onPressed: onPressedButton,
        ),
        Gap(20.h),
      ],
    );
  }
}
