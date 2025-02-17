part of 'categories_cubit.dart';

enum CategoriesStatus { loading, success, failure }

extension CategoriesStatusX on CategoriesState {
  bool get isAllCategoryLoading =>
      allCategoryStatus == CategoriesStatus.loading;
  bool get isAllCategorySuccess =>
      allCategoryStatus == CategoriesStatus.success;
  bool get isAllCategoryFailure =>
      allCategoryStatus == CategoriesStatus.failure;

  bool get isCreateCategoryLoading =>
      createCategoryStatus == CategoriesStatus.loading;
  bool get isCreateCategorySuccess =>
      createCategoryStatus == CategoriesStatus.success;
  bool get isCreateCategoryFailure =>
      createCategoryStatus == CategoriesStatus.failure;
}

class CategoriesState extends Equatable {
  final List<CategoriesData> allCategories;
  final CategoriesStatus allCategoryStatus;
  final String errorAllCategory;

  final CategoriesStatus createCategoryStatus;
  final CategoriesStatus uploadImageStatus;
  final String errorCreateCategory;
  XFile? image;

  final CategoriesStatus getUrlImageStatus;
  final String urlImage;
  final String errorGetUrlImage;

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  CategoriesState({
    this.allCategories = const [],
    this.allCategoryStatus = CategoriesStatus.loading,
    this.errorAllCategory = '',
    this.createCategoryStatus = CategoriesStatus.loading,
    this.errorCreateCategory = '',
    this.uploadImageStatus = CategoriesStatus.loading,
    this.image,
    this.getUrlImageStatus = CategoriesStatus.loading,
    this.urlImage = '',
    this.errorGetUrlImage = '',
    TextEditingController? controller,
    GlobalKey<FormState>? formKey,
  })  : controller = controller ?? TextEditingController(),
        formKey = formKey ?? GlobalKey<FormState>();

  CategoriesState copyWith({
    List<CategoriesData>? allCategories,
    CategoriesStatus? allCategoryStatus,
    String? errorAllCategory,
    CategoriesStatus? createCategoryStatus,
    String? errorCreateCategory,
    TextEditingController? controller,
    XFile? image,
    CategoriesStatus? uploadImageStatus,
    CategoriesStatus? getUrlImageStatus,
    String? urlImage,
    String? errorGetUrlImage,
    GlobalKey<FormState>? formKey,
  }) {
    return CategoriesState(
      allCategories: allCategories ?? this.allCategories,
      allCategoryStatus: allCategoryStatus ?? this.allCategoryStatus,
      errorAllCategory: errorAllCategory ?? this.errorAllCategory,
      createCategoryStatus: createCategoryStatus ?? this.createCategoryStatus,
      errorCreateCategory: errorCreateCategory ?? this.errorCreateCategory,
      image: image ?? this.image,
      uploadImageStatus: uploadImageStatus ?? this.uploadImageStatus,
      controller: controller ?? this.controller,
      formKey: formKey ?? this.formKey,
      getUrlImageStatus: getUrlImageStatus ?? this.getUrlImageStatus,
      urlImage: urlImage ?? this.urlImage,
      errorGetUrlImage: errorGetUrlImage ?? this.errorGetUrlImage,
    );
  }

  @override
  List<Object?> get props => [
        allCategories,
        allCategoryStatus,
        errorAllCategory,
        createCategoryStatus,
        errorCreateCategory,
        controller,
        image,
        uploadImageStatus,
        formKey,
        getUrlImageStatus,
      ];
}
