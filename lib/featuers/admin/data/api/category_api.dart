import 'dart:io';

import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/core/services/api/constant_api/constant_api.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:app_shop_ease/core/utils/app_image_pick.dart';
import 'package:app_shop_ease/featuers/admin/data/graphql/category_queries.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/create_category_response.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<Either<Failure, CreateCategoryResponse>> createCategory(
      CreateCategoryRequest request) async {
    try {
      var response = await dio.post(
        ConstantApi.graphql,
        data: queries.createCategoryQuery(CreateCategoryRequest(
          name: request.name,
          image: request.image,
        )),
      );
      return Right(CreateCategoryResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
