import 'package:animate_do/animate_do.dart';
import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/common/widget/button_app_widget.dart';
import 'package:app_shop_ease/core/common/widget/text_form_field_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(32.h),
            BounceInDown(
              from: 15,
              child: TextFormFieldWidget(
                title: AppLocalizations.of(context)!.name,
                hintText: 'Mohamed Esam',
                controller: TextEditingController(),
                validator: (value) => null,
              ),
            ),
            Gap(32.h),
            BounceInDown(
              from: 15,
              child: TextFormFieldWidget(
                title: AppLocalizations.of(context)!.email,
                hintText: 'mohamed@gmail.com',
                controller: TextEditingController(),
                validator: (value) => null,
              ),
            ),
            Gap(32.h),
            BounceInDown(
              from: 15,
              child: TextFormFieldWidget(
                title: AppLocalizations.of(context)!.password,
                hintText: '***********',
                controller: TextEditingController(),
                validator: (value) => null,
              ),
            ),
            Gap(32.h),
            BounceInDown(
              from: 15,
              child: ButtonAppWidget(
                  onPressed: () {},
                  title: AppLocalizations.of(context)!.signUp),
            ),
            Gap(32.h),
            BounceInDown(
              from: 15,
              child: InkWell(
                onTap: () {
                  context.pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  AppLocalizations.of(context)!.already_have_account,
                  style:
                      AppTextStyle.textStyle16CP.copyWith(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
