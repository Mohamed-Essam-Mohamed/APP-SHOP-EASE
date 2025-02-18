import 'package:app_shop_ease/core/app/check_internet.dart';
import 'package:app_shop_ease/core/app/env_variables.dart';
import 'package:app_shop_ease/core/utils/app_upload_file.dart';
import 'package:app_shop_ease/featuers/admin/data/api/category_api.dart';
import 'package:app_shop_ease/featuers/admin/data/api/dashboard_api.dart';
import 'package:app_shop_ease/featuers/admin/data/graphql/category_queries.dart';
import 'package:app_shop_ease/featuers/admin/data/graphql/dashbord_queries.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/data_source/category_data_source.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/data_source/dashboard_data_source.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/category_repository.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/dashboard_repository.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/add_category/add_category_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/dashboard/dashboard_cubit.dart';
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

    //? dashboard locator
    sl.registerLazySingleton<DashboardQueries>(
      () => DashboardQueries(),
    );
    sl.registerLazySingleton<DashboardApi>(
      () => DashboardApi(
        dio: sl<DioConsumer>(),
        queries: sl<DashboardQueries>(),
      ),
    );
    sl.registerLazySingleton<DashboardDataSource>(
      () => DashboardDataSource(api: sl<DashboardApi>()),
    );
    sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepository(dataSource: sl<DashboardDataSource>()),
    );
    sl.registerFactory<DashboardCubit>(
      () => DashboardCubit(
        repository: sl<DashboardRepository>(),
      ),
    );

    //? category locator
    sl.registerLazySingleton<CategoryQueries>(
      () => CategoryQueries(),
    );
    sl.registerLazySingleton<CategoryApi>(
      () => CategoryApi(
        dio: sl<DioConsumer>(),
        queries: sl<CategoryQueries>(),
      ),
    );
    sl.registerLazySingleton<CategoryDataSource>(
      () => CategoryDataSource(
        api: sl<CategoryApi>(),
      ),
    );
    sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepository(
        dataSource: sl<CategoryDataSource>(),
      ),
    );
    sl.registerFactory<GetAllCategoriesCubit>(
      () => GetAllCategoriesCubit(
        repository: sl<CategoryRepository>(),
      ),
    );
    sl.registerFactory<AddCategoryCubit>(
      () => AddCategoryCubit(
        repository: sl<CategoryRepository>(),
      ),
    );
    //? upload file
    sl.registerFactory<AppUploadFile>(
      () => AppUploadFile(dio: sl<DioConsumer>()),
    );
  }
}
