import 'package:app_shop_ease/core/utils/app_toast.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class AllCategoryListSection extends StatelessWidget {
  const AllCategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
      listener: (context, state) {
        if (state.isAllCategoryFailure) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: "Wrong to get categories Please try again...",
            type: ToastificationType.error,
          );
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
                  onPressedDelete: () {},
                  onPressedEdit: () {},
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
