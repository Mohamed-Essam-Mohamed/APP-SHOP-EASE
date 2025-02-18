import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/utils/app_upload_file.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/category_repository.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.repository}) : super(AddCategoryState());
  final CategoryRepository repository;

  void updateCategoryImage(XFile image) {
    emit(state.copyWith(
      selectedImageStatus: CategoriesStatus.loading,
      // addCategoryStatus: CategoriesStatus.initial,
    ));
    emit(state.copyWith(
      selectedImageStatus: CategoriesStatus.success,
      fileImage: image,
    ));
  }

  Future<void> createCategory() async {
    if (state.formKey.currentState!.validate()) {
      if (state.fileImage == null) {
        emit(state.copyWith(selectedImageStatus: CategoriesStatus.initial));
        emit(state.copyWith(
          selectedImageStatus: CategoriesStatus.failure,
          errorSelectedImage: "Please select image...",
        ));
        return;
      }

      // emit(state.copyWith(uploadImageStatus: CategoriesStatus.loading));
      emit(state.copyWith(addCategoryStatus: CategoriesStatus.loading));
      AppUploadFile appUploadFile = sl<AppUploadFile>();
      final result = await appUploadFile.uploadImage(state.fileImage!);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              uploadImageStatus: CategoriesStatus.failure,
              addCategoryStatus: CategoriesStatus.initial,
              errorUploadImage: "Wrong upload image Please try again...",
            ),
          );
          return;
        },
        (data) async {
          emit(state.copyWith(
            uploadImageStatus: CategoriesStatus.success,
            urlImage: data,
          ));
          final result = await repository.createCategory(
            CreateCategoryRequest(
              name: state.controller.text,
              image: state.urlImage!,
            ),
          );
          result.fold(
            (failure) {
              emit(state.copyWith(
                addCategoryStatus: CategoriesStatus.failure,
                errorAddCategory: "Error add category Please try again...",
              ));
            },
            (data) {
              emit(state.copyWith(addCategoryStatus: CategoriesStatus.success));
            },
          );
        },
      );
    }
  }
}
