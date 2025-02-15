import 'dart:io';

import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/core/services/api/constant_api/constant_api.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:app_shop_ease/featuers/admin/data/graphql/dashbord_queries.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/product_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/dashbord/users_response.dart';
import 'package:dartz/dartz.dart';

class DashboardApi {
  DashboardQueries queries;
  ApiConsumer dio;
  DashboardApi({required this.queries, required this.dio});
  //? get all products
  Future<Either<Failure, ProductResponse>> getAllProducts() async {
    try {
      final response = await dio.post(
        ConstantApi.graphql,
        data: queries.productsQuery(),
      );

      return Right(ProductResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  //? get all categories
  Future<Either<Failure, CategoryResponse>> getAllCategories() async {
    try {
      final response = await dio.post(
        ConstantApi.graphql,
        data: queries.categoriesQuery(),
      );

      return Right(CategoryResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  //? get all users
  Future<Either<Failure, UsersResponse>> getAllUsers() async {
    try {
      final response = await dio.post(
        ConstantApi.graphql,
        data: queries.usersQuery(),
      );

      return Right(UsersResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
