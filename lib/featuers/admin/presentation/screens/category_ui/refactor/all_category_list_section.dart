import 'dart:developer';
import 'dart:io';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/animation_shimmer/loading_shimmer.dart';
import 'package:app_shop_ease/core/common/widget/button_app_widget.dart';
import 'package:app_shop_ease/core/common/widget/custom_bottom_sheet.dart';
import 'package:app_shop_ease/core/common/widget/text_form_field_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_dailog.dart';
import 'package:app_shop_ease/core/utils/app_image_pick.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/core/utils/app_toast.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/update_category_request.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/add_category/add_category_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/category_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class AllCategoryListSection extends StatelessWidget {
  const AllCategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
      //   buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.isAllCategoryFailure) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: "Wrong to get categories Please try again...",
            type: ToastificationType.error,
          );
        }
        if (state.isDeleteCategoryFailure) {
          log("failure");
          AppToast.showToast(
            context: context,
            title: "warning",
            description: "Wrong to delete categories Please try again...",
            type: ToastificationType.warning,
          );
        }
        if (state.isDeleteCategorySuccess) {
          log("success");
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Category Deleted Successfully...",
            type: ToastificationType.success,
          );
        }
        if (state.isDeleteCategoryLoading) {
          log("loading");
          //   AppDialog.showLoading(context: context, message: "Loading...");
        }
      },
      builder: (context, state) {
        if (state.isAllCategoryLoading) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Gap(10.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Skeletonizer(
                  child: CategoryItem(
                    imagePath: '',
                    nameCategory: "Category Name",
                    onPressedDelete: null,
                    onPressedEdit: null,
                  ),
                );
              },
            ),
          );
        }
        if (state.isAllCategorySuccess) {
          return Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Gap(10.h),
              itemCount: state.allCategories.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  imagePath: state.allCategories[index].image ?? '',
                  nameCategory:
                      state.allCategories[index].name ?? "Category Name",
                  onPressedDelete: () {
                    context.read<GetAllCategoriesCubit>()
                      ..deleteCategory(state.allCategories[index].id ?? '0')
                      ..getAllCategories();
                  },
                  onPressedEdit: () {
                    CustomBottomSheet.showCustomBottomSheet(
                      backgroundColor: AppColor.secondaryColor,
                      context: context,
                      child: BlocProvider<AddCategoryCubit>(
                        create: (context) => sl<AddCategoryCubit>(),
                        child: BottomSheetUpdateSCategory(
                          dataToUpdate: UpdateCategoryRequest(
                            id: state.allCategories[index].id,
                            name: state.allCategories[index].name,
                            image: state.allCategories[index].image,
                          ),
                        ),
                      ),
                      whenComplete: () {
                        context
                            .read<GetAllCategoriesCubit>()
                            .getAllCategories();
                      },
                    );
                  },
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class BottomSheetUpdateSCategory extends StatelessWidget {
  const BottomSheetUpdateSCategory({super.key, required this.dataToUpdate});
  final UpdateCategoryRequest dataToUpdate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCategoryCubit, AddCategoryState>(
      listener: _listenerStates,
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Update Category",
                style: AppTextStyle.textStyle20CP.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(10.h),
              Text("Update a photo", style: AppTextStyle.textStyle18CP),
              Gap(5.h),
              InkWell(
                onTap: () async {
                  XFile? image = await AppImagePick.pickImage(context);
                  if (image == null) return;
                  context.read<AddCategoryCubit>().selectCategoryImage(image);
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
                  child: state.fileImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.file(
                            File(state.fileImage!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: dataToUpdate.image ?? "",
                            fit: BoxFit.cover,
                            width: 150.w,
                            height: double.infinity,
                            placeholder: (context, url) => LoadingShimmer(
                              borderRadius: 8.r,
                              width: 150.w,
                              height: double.infinity,
                            ),
                            errorWidget: (context, url, error) =>
                                LoadingShimmer(
                              borderRadius: 8.r,
                              width: 150.w,
                              height: double.infinity,
                            ),
                          ),
                        ),
                ),
              ),
              Gap(10.h),
              TextFormFieldWidget(
                title: "Category Name",
                hintText: dataToUpdate.name!,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter category name';
                  }
                  return null;
                },
                controller: TextEditingController(text: dataToUpdate.name),
                onChanged: (text) {
                  state.updateCategoryName = text;
                },
                fontSize: 18.sp,
              ),
              Gap(10.h),
              ButtonAppWidget(
                title: "Update a category",
                minWidth: double.infinity,
                onPressed: () {
                  context.read<AddCategoryCubit>().updateCategory(dataToUpdate);
                },
              ),
              Gap(20.h),
            ],
          ),
        );
      },
    );
  }

  void _listenerStates(BuildContext context, AddCategoryState state) {
    // //? listener for selected image
    // if (state.isSelectedImageFailure) {
    //   AppToast.showToast(
    //     context: context,
    //     title: "Warning",
    //     description: state.errorSelectedImage,
    //     type: ToastificationType.warning,
    //   );
    // }

    // //? listener for upload image to server
    if (state.isUploadImageFailure) {
      context.pop();
      AppToast.showToast(
        context: context,
        title: "Error",
        description: state.errorSelectedImage,
        type: ToastificationType.error,
      );
    }

    // //? listener for add category
    // if (state.isAddCategoryFailure) {
    //   context.pop();
    //   AppToast.showToast(
    //     context: context,
    //     title: "Error",
    //     description: state.errorAddCategory,
    //     type: ToastificationType.error,
    //   );
    // }

    // if (state.isAddCategorySuccess) {
    //   context.pop();
    //   context.pop();
    //   context.pop();
    //   AppToast.showToast(
    //     context: context,
    //     title: "Success",
    //     description: "Category Added Successfully...",
    //     type: ToastificationType.success,
    //   );
    // }
    // if (state.isAddCategoryLoading) {
    //   AppDialog.showLoading(context: context, message: "Loading...");
    // }

    if (state.isUpdateCategoryFailure) {
      context.pop();
      AppToast.showToast(
        context: context,
        title: "Error",
        description: state.errorUpdateCategory,
        type: ToastificationType.error,
      );
    }

    if (state.isUpdateCategorySuccess) {
      context.pop();
      context.pop();
      AppToast.showToast(
        context: context,
        title: "Success",
        description: "Category Updated Successfully...",
        type: ToastificationType.success,
      );
    }

    if (state.isUpdateCategoryLoading) {
      AppDialog.showLoading(context: context, message: "Loading...");
    }
  }
}
