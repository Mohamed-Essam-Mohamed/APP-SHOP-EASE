import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/admin/data/api/dashboard_api.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/product_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/users_response.dart';
import 'package:dartz/dartz.dart';

class DashboardDataSource {
  DashboardApi api;
  DashboardDataSource({required this.api});
  //? get all products
  Future<Either<Failure, ProductResponse>> getAllProducts() async {
    final either = await api.getAllProducts();
    return either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }

  //? get all categories
  Future<Either<Failure, CategoryResponse>> getAllCategories() async {
    final either = await api.getAllCategories();
    return either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }

  //? get all users
  Future<Either<Failure, UsersResponse>> getAllUsers() async {
    final either = await api.getAllUsers();
    return either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }
}
