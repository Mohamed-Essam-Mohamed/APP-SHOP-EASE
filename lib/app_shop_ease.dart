import 'package:app_shop_ease/core/app/check_internet.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/routes/app_routes.dart';
import 'package:app_shop_ease/core/utils/app_dark_theme.dart';
import 'package:app_shop_ease/core/utils/app_light_theme.dart';
import 'package:app_shop_ease/core/common/screens/internet_screen.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/hello_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  Widget build(BuildContext context) {
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
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: AppLightTheme.theme,
                darkTheme: AppDarkTheme.theme,
                themeMode: ThemeMode.light,
                initialRoute: HelloAuthScreen.routeName,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppLightTheme.theme,
                darkTheme: AppDarkTheme.theme,
                themeMode: ThemeMode.light,
                home: const InternetScreen(),
              );
            }
          },
        );
      },
    );
  }
}
