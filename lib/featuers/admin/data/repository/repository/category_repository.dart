import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/update_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/create_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/delete_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/update_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/data_source/category_data_source.dart';
import 'package:dartz/dartz.dart';

class CategoryRepository {
  final CategoryDataSource dataSource;
  CategoryRepository({required this.dataSource});

  Future<Either<Failure, AllCategoryResponse>> getAllCategories() async =>
      await dataSource.getAllCategories();

  Future<Either<Failure, CreateCategoryResponse>> createCategory(
          CreateCategoryRequest request) async =>
      await dataSource.createCategory(request);

  Future<Either<Failure, DeleteCategoryResponse>> deleteCategory(
          String id) async =>
      await dataSource.deleteCategory(id);

  Future<Either<Failure, UpdateCategoryResponse>> updateCategory({
    required UpdateCategoryRequest request,
  }) async =>
      await dataSource.updateCategory(request: request);
}
