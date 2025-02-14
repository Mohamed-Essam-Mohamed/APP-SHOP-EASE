// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_color.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBarWidget(
        isMain: true,
        backgroundColor: AppColor.secondaryColor,
        title: "Dashboard",
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          //? Products
          DashboardContainer(
            title: "Products",
            number: "4",
            image: AppImagesPng.products,
            isLoading: false,
          ),
          Gap(16.h),
          //? Categories
          DashboardContainer(
            title: "Categories",
            number: "4",
            image: AppImagesPng.categories,
            isLoading: false,
          ),
          Gap(16.h),
          //? orders
          DashboardContainer(
            title: "Users",
            number: "4",
            image: AppImagesPng.users,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
