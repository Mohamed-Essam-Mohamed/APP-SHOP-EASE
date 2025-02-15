import 'dart:developer';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/dashboard/dashboard_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/widget/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersSection extends StatefulWidget {
  const UsersSection({super.key});

  @override
  State<UsersSection> createState() => _UsersSectionState();
}

class _UsersSectionState extends State<UsersSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.isUserInitial || state.isUserLoading) {
          return const DashboardContainer(
            title: "Users",
            number: "1",
            image: AppImagesPng.users,
            isLoading: true,
          );
        } else if (state.isUserSuccess) {
          return DashboardContainer(
            title: "Users",
            number: state.userCount.toString(),
            image: AppImagesPng.users,
            isLoading: false,
          );
        } else if (state.isUserFailure) {
          return const DashboardContainer(
            title: "Warning",
            number: "1",
            image: AppImagesPng.users,
            isLoading: true,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
