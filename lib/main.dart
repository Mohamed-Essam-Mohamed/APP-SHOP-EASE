import 'package:app_shop_ease/app_shop_ease.dart';
import 'package:app_shop_ease/core/app/bloc_observer.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/enums/env_type_enum.dart';
import 'package:app_shop_ease/core/utils/app_shared_preference.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/user_data_response.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  UserDataResponse? fetchedUser = await SharedPreferencesUtils.getPref();

  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(AppShopEase(user: fetchedUser)));
}
