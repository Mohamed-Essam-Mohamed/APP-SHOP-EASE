part of 'add_category_cubit.dart';

extension AddCategoryStatusX on AddCategoryState {
  //? add category
  bool get isAddCategoryLoading =>
      addCategoryStatus == CategoriesStatus.loading;
  bool get isAddCategorySuccess =>
      addCategoryStatus == CategoriesStatus.success;
  bool get isAddCategoryFailure =>
      addCategoryStatus == CategoriesStatus.failure;
  //? selected image
  bool get isSelectedImageLoading =>
      selectedImageStatus == CategoriesStatus.loading;
  bool get isSelectedImageSuccess =>
      selectedImageStatus == CategoriesStatus.success;
  bool get isSelectedImageFailure =>
      selectedImageStatus == CategoriesStatus.failure;
  //? upload image
  bool get isUploadImageLoading =>
      uploadImageStatus == CategoriesStatus.loading;
  bool get isUploadImageSuccess =>
      uploadImageStatus == CategoriesStatus.success;
  bool get isUploadImageFailure =>
      uploadImageStatus == CategoriesStatus.failure;
}

class AddCategoryState extends Equatable {
  //? Fields of selected image
  final CategoriesStatus selectedImageStatus;
  final String errorSelectedImage;
  final XFile? fileImage;
  //? Fields of upload image
  final CategoriesStatus uploadImageStatus;
  final String errorUploadImage;
  //? Fields of add category
  final CategoriesStatus addCategoryStatus;
  final String errorAddCategory;
  final String? urlImage;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  AddCategoryState({
    this.selectedImageStatus = CategoriesStatus.initial,
    this.errorSelectedImage = '',
    this.fileImage,
    this.addCategoryStatus = CategoriesStatus.initial,
    this.errorAddCategory = '',
    this.urlImage,
    this.errorUploadImage = '',
    this.uploadImageStatus = CategoriesStatus.initial,
    TextEditingController? controller,
    GlobalKey<FormState>? formKey,
  })  : controller = controller ?? TextEditingController(),
        formKey = formKey ?? GlobalKey<FormState>();
  //? copyWith
  AddCategoryState copyWith({
    CategoriesStatus? selectedImageStatus,
    String? errorSelectedImage,
    XFile? fileImage,
    CategoriesStatus? uploadImageStatus,
    String? errorUploadImage,
    CategoriesStatus? addCategoryStatus,
    String? errorAddCategory,
    String? urlImage,
    GlobalKey<FormState>? formKey,
    TextEditingController? controller,
  }) {
    return AddCategoryState(
      selectedImageStatus: selectedImageStatus ?? this.selectedImageStatus,
      errorSelectedImage: errorSelectedImage ?? this.errorSelectedImage,
      fileImage: fileImage ?? this.fileImage,
      addCategoryStatus: addCategoryStatus ?? this.addCategoryStatus,
      errorAddCategory: errorAddCategory ?? this.errorAddCategory,
      urlImage: urlImage ?? this.urlImage,
      uploadImageStatus: uploadImageStatus ?? this.uploadImageStatus,
      errorUploadImage: errorUploadImage ?? this.errorUploadImage,
      formKey: formKey ?? this.formKey,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [
        selectedImageStatus,
        errorSelectedImage,
        fileImage,
        uploadImageStatus,
        errorUploadImage,
        addCategoryStatus,
        formKey,
        controller,
        errorAddCategory,
        urlImage,
      ];
}
