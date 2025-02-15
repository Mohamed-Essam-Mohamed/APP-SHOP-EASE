// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/dashboard_ui/refactor/categories_section.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/dashboard_ui/refactor/product_section.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/dashboard_ui/refactor/users_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_color.dart';
import '../../controller/dashboard/dashboard_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBarWidget(
        isMain: true,
        backgroundColor: AppColor.secondaryColor,
        title: "Dashboard",
      ),
      body: BlocProvider<DashboardCubit>(
        create: (context) => sl<DashboardCubit>()
          ..getAllCategories()
          ..getAllProducts()
          ..getAllUsers(),
        child: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              final cubit =
                  BlocProvider.of<DashboardCubit>(context, listen: false);
              await Future.wait([
                cubit.getAllProducts(),
                cubit.getAllCategories(),
                cubit.getAllUsers(),
              ]);
            },
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                //? Products
                const ProductSection(),
                Gap(16.h),
                //? Categories
                const CategoriesSection(),
                Gap(16.h),
                //? users
                const UsersSection(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
