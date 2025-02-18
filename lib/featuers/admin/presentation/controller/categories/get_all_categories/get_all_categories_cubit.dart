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
    emit(state.copyWith(allCategoryStatus: CategoriesStatus.loading));
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
          allCategories: data.data?.categories,
        ),
      ),
    );
  }
}
