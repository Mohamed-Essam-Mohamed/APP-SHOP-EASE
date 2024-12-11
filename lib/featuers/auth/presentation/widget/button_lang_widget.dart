import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLangWidget extends StatelessWidget {
  const ButtonLangWidget({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 2,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Text(
          AppLocalizations.of(context)!.app_lang,
          style: AppTextStyle.textStyle16CP.copyWith(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
