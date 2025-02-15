// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AdminAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBarWidget({
    required this.isMain,
    required this.backgroundColor,
    required this.title,
    this.colorText,
    super.key,
  });
  final bool isMain;
  final Color backgroundColor;
  final Color? colorText;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: AppTextStyle.textStyle20CP.copyWith(
          color: colorText ?? AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: isMain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: const Icon(
                Icons.menu,
                color: AppColor.primaryColor,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
