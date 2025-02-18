import 'dart:developer';

import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit({required this.repository})
      : super(const GetAllCategoriesState());
  final CategoryRepository repository;

  Future<void> getAllCategories() async {
    emit(state.copyWith(
      deleteCategoryStatus: CategoriesStatus.initial,
      allCategoryStatus: CategoriesStatus.loading,
    ));
    final result = await repository.getAllCategories();
    result.fold(
      (failure) => emit(
        state.copyWith(
          allCategoryStatus: CategoriesStatus.failure,
          errorAllCategory: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          allCategoryStatus: CategoriesStatus.success,
          deleteCategoryStatus: CategoriesStatus.initial,
          allCategories: data.data?.categories,
        ),
      ),
    );
  }

  Future<void> deleteCategory(String id) async {
    emit(state.copyWith(deleteCategoryStatus: CategoriesStatus.loading));
    final result = await repository.deleteCategory(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            deleteCategoryStatus: CategoriesStatus.failure,
            errorDeleteCategory: failure.message,
          ),
        );
      },
      (data) => emit(
        state.copyWith(
          deleteCategoryStatus: CategoriesStatus.success,
        ),
      ),
    );
  }
}
