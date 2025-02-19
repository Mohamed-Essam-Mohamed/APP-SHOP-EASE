part of 'get_all_categories_cubit.dart';

enum CategoriesStatus { loading, success, failure, initial }

extension GetAllCategoriesStatusX on GetAllCategoriesState {
  // get all categories
  bool get isAllCategoryLoading =>
      allCategoryStatus == CategoriesStatus.loading;
  bool get isAllCategorySuccess =>
      allCategoryStatus == CategoriesStatus.success;
  bool get isAllCategoryFailure =>
      allCategoryStatus == CategoriesStatus.failure;
  // delete category
  bool get isDeleteCategoryLoading =>
      deleteCategoryStatus == CategoriesStatus.loading;
  bool get isDeleteCategorySuccess =>
      deleteCategoryStatus == CategoriesStatus.success;
  bool get isDeleteCategoryFailure =>
      deleteCategoryStatus == CategoriesStatus.failure;
}

class GetAllCategoriesState extends Equatable {
  //? get all categories
  final List<CategoriesData> allCategories;
  final CategoriesStatus allCategoryStatus;
  final String errorAllCategory;

  //? delete item category
  final CategoriesStatus deleteCategoryStatus;
  final String errorDeleteCategory;

  const GetAllCategoriesState({
    // data field get all
    this.allCategories = const [],
    this.allCategoryStatus = CategoriesStatus.initial,
    this.errorAllCategory = '',
    // data field delete
    this.deleteCategoryStatus = CategoriesStatus.initial,
    this.errorDeleteCategory = '',
  });

  GetAllCategoriesState copyWith({
    List<CategoriesData>? allCategories,
    CategoriesStatus? allCategoryStatus,
    String? errorAllCategory,
    CategoriesStatus? deleteCategoryStatus,
    String? errorDeleteCategory,
  }) {
    return GetAllCategoriesState(
      // data field get all category
      allCategories: allCategories ?? this.allCategories,
      allCategoryStatus: allCategoryStatus ?? this.allCategoryStatus,
      errorAllCategory: errorAllCategory ?? this.errorAllCategory,
      // data field delete
      deleteCategoryStatus: deleteCategoryStatus ?? this.deleteCategoryStatus,
      errorDeleteCategory: errorDeleteCategory ?? this.errorDeleteCategory,
    );
  }

  @override
  List<Object?> get props => [
        // data field get all
        allCategories,
        allCategoryStatus,
        errorAllCategory,
        //data field delete
        deleteCategoryStatus,
        errorDeleteCategory,
      ];
}
