import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/admin/data/api/category_api.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/create_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/delete_category_response.dart';
import 'package:dartz/dartz.dart';

class CategoryDataSource {
  final CategoryApi api;

  CategoryDataSource({required this.api});

  Future<Either<Failure, AllCategoryResponse>> getAllCategories() async {
    var either = await api.getAllCategories();

    return await either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }

  Future<Either<Failure, CreateCategoryResponse>> createCategory(
      CreateCategoryRequest request) async {
    var either = await api.createCategory(request);

    return await either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }

  Future<Either<Failure, DeleteCategoryResponse>> deleteCategory(
      String id) async {
    var either = await api.deleteCategory(id);

    return await either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }
}
