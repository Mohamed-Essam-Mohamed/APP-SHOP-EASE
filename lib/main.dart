import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/enums/env_type_enum.dart';
// import 'package:app_shop_ease/featuers/auth/data/api/api_auth.dart';
import 'package:app_shop_ease/core/utils/app_shared_preference.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    ServicesLocator().init(),
    EnvVariables().init(EnvTypeEnum.prod),
    SharedPreferencesUtils.init(),
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // AuthApi apiAuth = sl<AuthApi>();

  // apiAuth.login(
  //     request: LoginRequest(
  //   email: "esammww.com@gmail.com",
  //   password: "123456789",
  // ));
  // apiAuth.userDataResponse(
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjYwLCJpYXQiOjE3MzQxMzc0MjUsImV4cCI6MTczNTg2NTQyNX0.P7NaIMR_-1hrmtr6cfpTejC4APMTBSP0v6ofpbnotcI");

  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const AppShopEase()));
}
