import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/product_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/users_response.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/data_source/dashboard_data_source.dart';
import 'package:dartz/dartz.dart';

class DashboardRepository {
  DashboardDataSource dataSource;

  DashboardRepository({required this.dataSource});
  //? get all products
  Future<Either<Failure, ProductResponse>> getAllProducts() async =>
      await dataSource.getAllProducts();
  //? get all categories
  Future<Either<Failure, CategoryResponse>> getAllCategories() async =>
      await dataSource.getAllCategories();
  //? get all users
  Future<Either<Failure, UsersResponse>> getAllUsers() async =>
      await dataSource.getAllUsers();
}
