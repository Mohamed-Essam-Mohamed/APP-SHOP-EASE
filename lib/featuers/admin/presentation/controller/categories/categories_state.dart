part of 'categories_cubit.dart';

enum CategoriesStatus { loading, success, failure }

extension CategoriesStatusX on CategoriesState {
  bool get isAllCategoryLoading =>
      allCategoryStatus == CategoriesStatus.loading;
  bool get isAllCategorySuccess =>
      allCategoryStatus == CategoriesStatus.success;
  bool get isAllCategoryFailure =>
      allCategoryStatus == CategoriesStatus.failure;
}

class CategoriesState extends Equatable {
  final List<CategoriesData> allCategories;
  final CategoriesStatus allCategoryStatus;
  final String errorAllCategory;
  const CategoriesState({
    this.allCategories = const [],
    this.allCategoryStatus = CategoriesStatus.loading,
    this.errorAllCategory = '',
  });

  CategoriesState copyWith({
    List<CategoriesData>? allCategories,
    CategoriesStatus? allCategoryStatus,
    String? errorAllCategory,
  }) {
    return CategoriesState(
      allCategories: allCategories ?? this.allCategories,
      allCategoryStatus: allCategoryStatus ?? this.allCategoryStatus,
      errorAllCategory: errorAllCategory ?? this.errorAllCategory,
    );
  }

  @override
  List<Object> get props => [
        allCategories,
        allCategoryStatus,
        errorAllCategory,
      ];
}
