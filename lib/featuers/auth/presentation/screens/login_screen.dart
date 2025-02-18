import 'package:animate_do/animate_do.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/common/widget/button_app_widget.dart';
import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/core/utils/app_dailog.dart';
import 'package:app_shop_ease/core/utils/app_text_style.dart';
import 'package:app_shop_ease/featuers/admin/presentation/screens/admin_home_screen.dart';
import 'package:app_shop_ease/featuers/auth/data/repository/repository/auth_repository.dart';
import 'package:app_shop_ease/featuers/auth/presentation/controller/login/login_bloc.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/register_screen.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/app_init_screen.dart';
import 'package:app_shop_ease/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widget/text_form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = '/login-screen';
  // LoginBloc bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).login,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocProvider<LoginBloc>(
          create: (context) => sl<LoginBloc>(),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginStateLoading) {
                AppDialog.showLoading(
                    context: context, message: S.of(context).loading);
              }
              if (state is LoginStateError) {
                context.pop();
                AppDialog.showMessage(
                  context: context,
                  message: state.message,
                );
              }
              if (state is LoginStateSuccess) {
                context.pop();
                if (state.role == 'admin') {
                  context.pushNamedAndRemoveUntil(
                    AdminHomeScreen.routeName,
                  );
                } else {
                  context.pushNamedAndRemoveUntil(
                    AppInitScreen.routeName,
                  );
                }
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<LoginBloc>(context).formKey,
                child: Column(
                  children: [
                    Gap(32.h),
                    BounceInDown(
                      from: 15,
                      child: TextFormFieldWidget(
                        title: S.of(context).email,
                        hintText: 'mohamed@gmail.com',
                        controller:
                            BlocProvider.of<LoginBloc>(context).emailController,
                        validator: (value) {
                          if (value != null &&
                              value.isEmpty &&
                              !value.contains('@')) {
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
                        isSecureText: true,
                        controller: BlocProvider.of<LoginBloc>(context)
                            .passwordController,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
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
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginAppEvent());
                        },
                        title: S.of(context).login,
                      ),
                    ),
                    Gap(32.h),
                    BounceInDown(
                      from: 15,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          S.of(context).dont_have_account,
                          style: AppTextStyle.textStyle16CP
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/**
 * 
 */