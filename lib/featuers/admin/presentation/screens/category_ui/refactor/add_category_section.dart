import 'dart:developer';
import 'dart:io';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/widget/custom_bottom_sheet.dart';
import 'package:app_shop_ease/core/common/widget/text_form_field_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_image_pick.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/core/utils/app_toast.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';

import '../../../../../../core/common/widget/button_app_widget.dart';

class AddCategorySection extends StatelessWidget {
  const AddCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add New Category", style: AppTextStyle.textStyle20CP),
          // const Spacer(),
          ButtonAppWidget(
            onPressed: () {
              CustomBottomSheet.showCustomBottomSheet(
                backgroundColor: AppColor.secondaryColor,
                context: context,
                child: BlocProvider<CategoriesCubit>(
                  create: (context) => sl<CategoriesCubit>(),
                  child: BottomSheetCategory(),
                ),
                whenComplete: () {
                  log("whenComplete");
                  context.read<CategoriesCubit>().getAllCategories();
                },
              );
            },
            title: "Add",
            minWidth: 100,
          ),
        ],
      ),
    );
  }
}

class BottomSheetCategory extends StatelessWidget {
  const BottomSheetCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state.isCreateCategoryFailure) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.errorCreateCategory,
            type: ToastificationType.warning,
          );
          log(state.errorCreateCategory);
        }
        if (state.isCreateCategorySuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Category Added Successfully...",
            type: ToastificationType.success,
          );
          context.pop();
        }
      },
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Category",
                style: AppTextStyle.textStyle20CP.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(10.h),
              Text("Add a photo", style: AppTextStyle.textStyle18CP),
              Gap(5.h),
              InkWell(
                onTap: () async {
                  XFile? image = await AppImagePick.pickImage(context);
                  if (image == null) return;
                  context.read<CategoriesCubit>().updateCategoryImage(image);
                },
                child: Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.primaryColor, width: 1.5.w),
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.grayColor,
                  ),
                  child: state.image == null
                      ? Icon(
                          Icons.add_a_photo_outlined,
                          size: 80.sp,
                          color: AppColor.grayAppColor,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.file(
                            File(state.image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              Gap(10.h),
              TextFormFieldWidget(
                title: "Enter the category name",
                hintText: "category name",
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter category name';
                  }
                  return null;
                },
                controller: state.controller,
                fontSize: 18.sp,
              ),
              Gap(10.h),
              ButtonAppWidget(
                title: "Create a new category",
                minWidth: double.infinity,
                onPressed: () {
                  log(state.image!.path);
                  context.read<CategoriesCubit>().createCategory();
                },
              ),
              Gap(20.h),
            ],
          ),
        );
      },
    );
  }
}
