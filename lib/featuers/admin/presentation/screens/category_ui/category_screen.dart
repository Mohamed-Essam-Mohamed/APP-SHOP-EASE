import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/category_ui/refactor/add_category_section.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/category_ui/refactor/all_category_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBarWidget(
        isMain: true,
        backgroundColor: AppColor.secondaryColor,
        title: "Category",
      ),
      body: BlocProvider<GetAllCategoriesCubit>(
        create: (context) => sl<GetAllCategoriesCubit>()..getAllCategories(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: [
              const AddCategorySection(),
              Gap(16.h),
              const AllCategoryListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
