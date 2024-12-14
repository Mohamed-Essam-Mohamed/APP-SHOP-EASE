import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});
  static const routeName = "AdminHomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Home",
          style: AppTextStyle.textStyle22CP,
        ),
      ),
    );
  }
}
