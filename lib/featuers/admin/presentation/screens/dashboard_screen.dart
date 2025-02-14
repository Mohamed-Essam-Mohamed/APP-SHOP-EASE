import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBarWidget(
        isMain: true,
        backgroundColor: AppColor.grayColor,
        title: "Shop Ease",
      ),
      body: Center(
        child: Text(
          "Dashboard Screen",
        ),
      ),
    );
  }
}
