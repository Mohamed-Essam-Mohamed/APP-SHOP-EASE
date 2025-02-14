import 'package:app_shop_ease/core/app/check_internet.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/featuers/auth/data/api/api_auth.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:app_shop_ease/featuers/auth/data/graphql/auth_queries.dart';
import 'package:app_shop_ease/featuers/auth/data/repository/data_source/auth_data_source.dart';
import 'package:app_shop_ease/featuers/auth/data/repository/repository/auth_repository.dart';
import 'package:app_shop_ease/featuers/auth/presentation/controller/login/login_bloc.dart';
import 'package:app_shop_ease/featuers/auth/presentation/controller/register/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    // sl.registerLazySingleton<EnvVariables>(
    //   () => EnvVariables(),
    // );
    sl.registerFactory<CheckInternet>(
      () => CheckInternet(),
    );
    sl.registerLazySingleton<Dio>(
      () => Dio(),
    );
    sl.registerLazySingleton<DioConsumer>(
      () => DioConsumer(dio: sl<Dio>()),
    );
    sl.registerLazySingleton<AuthQueries>(
      () => AuthQueries(),
    );
    sl.registerLazySingleton<AuthApi>(
      () => AuthApi(dio: sl<DioConsumer>(), authQueries: sl<AuthQueries>()),
    );
    sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(authApi: sl<AuthApi>()),
    );
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(authDataSource: sl<AuthDataSource>()),
    );
    sl.registerFactory<LoginBloc>(
      () => LoginBloc(authRepository: sl<AuthRepository>()),
    );
    sl.registerFactory<RegisterBloc>(
      () => RegisterBloc(authRepository: sl()),
    );
  }
}
