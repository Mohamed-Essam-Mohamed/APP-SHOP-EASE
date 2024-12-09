import 'package:app_shop_ease/core/common/screens/internet_screen.dart';
import 'package:app_shop_ease/core/routes/animation_routes.dart';
import 'package:app_shop_ease/home_screen.dart';
import 'package:app_shop_ease/next_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case HomeScreen.routeName:
        return AnimationRoute(page: const HomeScreen());
      case NextScreen.routeName:
        return AnimationRoute(page: const NextScreen());
      default:
        return AnimationRoute(page: const InternetScreen());
    }
  }
}
