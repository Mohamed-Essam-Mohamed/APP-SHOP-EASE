// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/category_ui/category_screen.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/add_notification_screen.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/add_products_screen.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/dashboard_ui/dashboard_screen.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemModel {
  final Widget icon;
  final Widget title;
  final Widget page;
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });
}

List<DrawerItemModel> adminDrawerListWidget(BuildContext context) =>
    <DrawerItemModel>[
      //? Dashboard
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.dashboard,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.secondaryColor,
        ),
        title: Text(
          'DashBoard',
          style: AppTextStyle.textStyle18CP
              .copyWith(color: AppColor.secondaryColor),
        ),
        page: const DashboardScreen(),
      ),
      //? Categories
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.category,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.secondaryColor,
        ),
        title: Text(
          'Categories',
          style: AppTextStyle.textStyle18CP
              .copyWith(color: AppColor.secondaryColor),
        ),
        page: const CategoryScreen(),
      ),
      //? Products
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.product,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.secondaryColor,
        ),
        title: Text(
          'Products',
          style: AppTextStyle.textStyle18CP
              .copyWith(color: AppColor.secondaryColor),
        ),
        page: const AddProductsScreen(),
      ),
      //? Users
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.users,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.secondaryColor,
        ),
        title: Text(
          'Users',
          style: AppTextStyle.textStyle18CP
              .copyWith(color: AppColor.secondaryColor),
        ),
        page: const UsersScreen(),
      ),
      //? Notifications
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.notification,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.secondaryColor,
        ),
        title: Text(
          'Notifications',
          style: AppTextStyle.textStyle18CP
              .copyWith(color: AppColor.secondaryColor),
        ),
        page: const AddNotificationScreen(),
      ),
      //? Logout
      DrawerItemModel(
        icon: Image.asset(
          AppIconsPng.logout,
          height: 22.h,
          width: 22.w,
          fit: BoxFit.cover,
          color: AppColor.redColor,
        ),
        title: Text(
          'Logout',
          style: AppTextStyle.textStyle18CP.copyWith(color: AppColor.redColor),
        ),
        page: const AddNotificationScreen(),
      )
    ];
