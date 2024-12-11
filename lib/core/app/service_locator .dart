import 'package:app_shop_ease/core/app/check_internet.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/core/app_cubit/app_cubit_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    sl.registerLazySingleton<EnvVariables>(
      () => EnvVariables(),
    );
    sl.registerFactory<CheckInternet>(
      () => CheckInternet(),
    );
    // sl.registerFactory<AppCubitCubit>(
    //   () => AppCubitCubit(),
    // );
  }
}
