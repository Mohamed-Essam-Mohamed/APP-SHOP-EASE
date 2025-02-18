import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarWidget(
        isMain: true,
        backgroundColor: AppColor.grayColor,
        title: "Shop Ease",
      ),
      body: Center(
        child: Text(
          "Users Screen",
        ),
      ),
    );
  }
}
