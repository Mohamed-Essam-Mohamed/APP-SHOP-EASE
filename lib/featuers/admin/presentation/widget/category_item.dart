import 'package:app_shop_ease/core/common/animation_shimmer/loading_shimmer.dart';
import 'package:app_shop_ease/core/common/widget/container_liner_admin_widget.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.imagePath,
    required this.nameCategory,
    this.onPressedDelete,
    this.onPressedEdit,
    super.key,
  });
  final String nameCategory;
  final String imagePath;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;

  @override
  Widget build(BuildContext context) {
    return ContainerLinearAdminWidget(
      height: 110.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameCategory,
                  style: AppTextStyle.textStyle20CP.copyWith(
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: onPressedDelete,
                      icon: Icon(
                        Icons.delete,
                        color: AppColor.redColor,
                        size: 30.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: onPressedEdit,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                width: 150.w,
                height: double.infinity,
                placeholder: (context, url) => LoadingShimmer(
                  borderRadius: 8.r,
                  width: 150.w,
                  height: double.infinity,
                ),
                errorWidget: (context, url, error) => LoadingShimmer(
                  borderRadius: 8.r,
                  width: 150.w,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
