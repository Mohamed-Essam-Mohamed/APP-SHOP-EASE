import 'package:animate_do/animate_do.dart';
import 'package:app_shop_ease/core/common/widget/button_app_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/login_screen.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelloAuthScreen extends StatelessWidget {
  const HelloAuthScreen({super.key});
  static const routeName = "hello-auth-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeIn(
                child: SvgPicture.asset(
                  "assets/images/image-hello.svg",
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(24.h),
              FadeInLeft(
                child: Text(
                  AppLocalizations.of(context)!.hello,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyle60CP,
                ),
              ),
              Gap(8.h),
              BounceInDown(
                from: 10,
                child: ButtonAppWidget(
                  onPressed: () {
                    context.pushNamed(
                      RegisterScreen.routeName,
                    );
                  },
                  title: AppLocalizations.of(context)!.signUp,
                ),
              ),
              Gap(24.h),
              BounceInDown(
                from: 10,
                child: ButtonAppWidget(
                  isFilled: false,
                  onPressed: () {
                    context.pushNamed(
                      LoginScreen.routeName,
                    );
                  },
                  title: AppLocalizations.of(context)!.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
