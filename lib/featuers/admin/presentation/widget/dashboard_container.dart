// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_shop_ease/core/common/animation_shimmer/loading_shimmer.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:app_shop_ease/core/common/widget/container_liner_admin_widget.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
    super.key,
  });
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ContainerLinearAdminWidget(
      height: 130.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  title,
                  style: AppTextStyle.textStyle22CP.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondaryColor,
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(
                    height: 30.h,
                    width: 100.w,
                  )
                else
                  Text(
                    number,
                    style: AppTextStyle.textStyle22CP.copyWith(
                      color: AppColor.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 90.h,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
  }
}
