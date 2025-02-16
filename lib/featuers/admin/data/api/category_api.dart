import 'dart:io';

import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/core/services/api/constant_api/constant_api.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:app_shop_ease/featuers/admin/data/graphql/category_queries.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:dartz/dartz.dart';

class CategoryApi {
  CategoryQueries queries;
  ApiConsumer dio;
  CategoryApi({required this.queries, required this.dio});

  Future<Either<Failure, AllCategoryResponse>> getAllCategories() async {
    try {
      var response = await dio.post(
        ConstantApi.graphql,
        data: queries.getAllCategoriesQuery(),
      );
      return Right(AllCategoryResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
