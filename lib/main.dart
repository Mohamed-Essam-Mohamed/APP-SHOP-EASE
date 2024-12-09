import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/enums/env_type_enum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sl<EnvVariables>().init(EnvTypeEnum.prod);

  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const AppShopEase()));
}
