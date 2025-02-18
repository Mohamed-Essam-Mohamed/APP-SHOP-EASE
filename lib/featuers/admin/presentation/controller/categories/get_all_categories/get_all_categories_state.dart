part of 'get_all_categories_cubit.dart';

enum CategoriesStatus { loading, success, failure }

extension GetAllCategoriesStatusX on GetAllCategoriesState {
  bool get isAllCategoryLoading =>
      allCategoryStatus == CategoriesStatus.loading;
  bool get isAllCategorySuccess =>
      allCategoryStatus == CategoriesStatus.success;
  bool get isAllCategoryFailure =>
      allCategoryStatus == CategoriesStatus.failure;
}

class GetAllCategoriesState extends Equatable {
  final List<CategoriesData> allCategories;
  final CategoriesStatus allCategoryStatus;
  final String errorAllCategory;

  const GetAllCategoriesState({
    this.allCategories = const [],
    this.allCategoryStatus = CategoriesStatus.loading,
    this.errorAllCategory = '',
  });

  GetAllCategoriesState copyWith({
    List<CategoriesData>? allCategories,
    CategoriesStatus? allCategoryStatus,
    String? errorAllCategory,
  }) {
    return GetAllCategoriesState(
      allCategories: allCategories ?? this.allCategories,
      allCategoryStatus: allCategoryStatus ?? this.allCategoryStatus,
      errorAllCategory: errorAllCategory ?? this.errorAllCategory,
    );
  }

  @override
  List<Object?> get props => [
        allCategories,
        allCategoryStatus,
        errorAllCategory,
      ];
}
