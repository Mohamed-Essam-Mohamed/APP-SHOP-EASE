import 'package:app_shop_ease/core/common/screens/internet_screen.dart';
import 'package:app_shop_ease/core/routes/animation_routes.dart';
import 'package:app_shop_ease/featuers/auth/presentation/screens/hello_auth_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case HelloAuthScreen.routeName:
        return AnimationRoute(page: const HelloAuthScreen());

      default:
        return AnimationRoute(page: const InternetScreen());
    }
  }
}
