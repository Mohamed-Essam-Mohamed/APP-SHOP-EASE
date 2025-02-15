import 'dart:developer';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/dashboard/dashboard_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.isCategoryLoading || state.isCategoryInitial) {
          return const DashboardContainer(
            title: "Categories",
            number: "1",
            image: AppImagesPng.categories,
            isLoading: true,
          );
        }
        if (state.isCategorySuccess) {
          return DashboardContainer(
            title: "Categories",
            number: state.categoryCount.toString(),
            image: AppImagesPng.categories,
            isLoading: false,
          );
        }
        if (state.isCategoryFailure) {
          return const DashboardContainer(
            title: "Warning",
            number: "1",
            image: AppImagesPng.categories,
            isLoading: true,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
