import 'dart:developer';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/dashboard/dashboard_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.isProductLoading || state.isProductInitial) {
          return const DashboardContainer(
            title: "Products",
            number: "1",
            image: AppImagesPng.products,
            isLoading: true,
          );
        } else if (state.isProductSuccess) {
          return DashboardContainer(
            title: "Products",
            number: state.productCount.toString(),
            image: AppImagesPng.products,
            isLoading: false,
          );
        } else if (state.isProductFailure) {
          return const DashboardContainer(
            title: "Warning",
            number: "1",
            image: AppImagesPng.products,
            isLoading: true,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
