import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/common/widget/admin_app_bar_widget.dart';
import 'package:app_shop_ease/core/common/widget/admin_drawer_list_widget.dart';
import 'package:app_shop_ease/core/constant/app_assets.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});
  static const routeName = "AdminHomeScreen";

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) => MenuAdminScreen(
          onPageChange: (newPage) {
            setState(() {
              page = newPage;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
      mainScreen: page,
      borderRadius: 24.sp,
      showShadow: true,
      drawerShadowsBackgroundColor: AppColor.secondaryColor,
      menuBackgroundColor: AppColor.primaryColor,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key, required this.onPageChange});
  final void Function(Widget) onPageChange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: const AdminAppBarWidget(
        isMain: false,
        backgroundColor: AppColor.primaryColor,
        title: "Shop Ease",
        colorText: AppColor.secondaryColor,
      ),
      body: Column(
        children: [
          ...adminDrawerListWidget(context)
              .map((e) => ListTile(
                    onTap: () {
                      onPageChange(e.page);
                    },
                    title: e.title,
                    leading: e.icon,
                  ))
              .toList(),
          Expanded(
            child: Image.asset(
              AppIconsPng.logo,
            ),
          )
        ],
      ),
    );
  }
}
