import 'package:animate_do/animate_do.dart';
import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/widget/button_app_widget.dart';
import 'package:app_shop_ease/core/common/widget/text_form_field_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_dailog.dart';
import 'package:app_shop_ease/core/utils/app_image_pick.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/auth/presentation/controller/register/register_bloc.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/login_screen.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/app_init_screen.dart';
import 'package:app_shop_ease/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const routeName = '/register-screen';
  final RegisterBloc bloc = sl<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context)!.signUp,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocListener<RegisterBloc, RegisterState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is RegisterLoading) {
              AppDialog.showLoading(
                  context: context, message: S.of(context).loading);
            }
            if (state is RegisterError) {
              context.pop();
              AppDialog.showMessage(
                context: context,
                message: state.message,
              );
            }

            if (state is RegisterSuccess) {
              // AppDialog.showMessage(
              //     context: context,
              //     message: S.of(context)!.success_login);
              // Navigator.pushNamed(context, RegisterScreen.routeName);
              context.pop();

              context.pushNamedAndRemoveUntil(
                AppInitScreen.routeName,
              );
            }
          },
          child: Form(
            key: bloc.formKey,
            child: Column(
              children: [
                Gap(32.h),
                BounceInDown(
                  from: 15,
                  child: TextFormFieldWidget(
                    title: S.of(context).name,
                    hintText: 'Mohamed Esam',
                    controller: bloc.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enter_valid_name;
                      }
                      return null;
                    },
                  ),
                ),
                Gap(32.h),
                BounceInDown(
                  from: 15,
                  child: TextFormFieldWidget(
                    title: S.of(context).email,
                    hintText: 'mohamed@gmail.com',
                    controller: bloc.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enter_valid_email;
                      }
                      return null;
                    },
                  ),
                ),
                Gap(32.h),
                BounceInDown(
                  from: 15,
                  child: TextFormFieldWidget(
                    title: S.of(context).password,
                    hintText: '***********',
                    controller: bloc.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enter_valid_password;
                      }
                      return null;
                    },
                  ),
                ),
                Gap(32.h),
                BounceInDown(
                  from: 15,
                  child: ButtonAppWidget(
                    onPressed: () {
                      bloc.add(RegisterAppEvent());
                    },
                    title: S.of(context).signUp,
                  ),
                ),
                Gap(32.h),
                BounceInDown(
                  from: 15,
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      S.of(context).already_have_account,
                      style: AppTextStyle.textStyle16CP
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
