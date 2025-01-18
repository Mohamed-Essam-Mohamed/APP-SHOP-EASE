// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_shop_ease/core/app/check_internet.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/app_cubit/app_cubit_cubit.dart';
import 'package:app_shop_ease/core/routes/app_routes.dart';
import 'package:app_shop_ease/core/utils/app_dark_theme.dart';
import 'package:app_shop_ease/core/utils/app_light_theme.dart';
import 'package:app_shop_ease/core/common/screens/internet_screen.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/hello_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';

class AppShopEase extends StatefulWidget {
  const AppShopEase({super.key});

  @override
  State<AppShopEase> createState() => _AppShopEaseState();
}

class _AppShopEaseState extends State<AppShopEase> {
  // This widget is the root of your application.
  @override
  void initState() {
    sl<CheckInternet>().init();
    super.initState();
  }

  AppCubitCubit cubit = AppCubitCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubitCubit>(
      create: (context) => cubit,
      child: BlocBuilder<AppCubitCubit, AppCubitState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return ValueListenableBuilder(
                valueListenable: CheckInternet.isConnected,
                builder: (_, value, __) {
                  if (value) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: AppLightTheme.theme,
                      darkTheme: AppDarkTheme.theme,
                      themeMode: ThemeMode.light,
                      initialRoute: HelloAuthScreen.routeName,
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      localizationsDelegates: [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Locale(cubit.lang as String),
                    );
                  } else {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: AppLightTheme.theme,
                      darkTheme: AppDarkTheme.theme,
                      themeMode: ThemeMode.light,
                      localizationsDelegates: [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Locale(cubit.lang as String),
                      home: const InternetScreen(),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
