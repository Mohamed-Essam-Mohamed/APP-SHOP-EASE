import 'dart:developer';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/utils/app_upload_file.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/update_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/category_repository.dart';
import 'package:app_shop_ease/featuers/admin/presentation/controller/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.repository}) : super(AddCategoryState()) {
    appUploadFile = sl<AppUploadFile>();
  }
  final CategoryRepository repository;
  late AppUploadFile appUploadFile;
  void selectCategoryImage(XFile image) {
    emit(state.copyWith(
      selectedImageStatus: CategoriesStatus.loading,
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

  Future<void> updateCategory(UpdateCategoryRequest dataRequest) async {
    if (state.fileImage != null) {
      emit(state.copyWith(updateCategoryStatus: CategoriesStatus.loading));
      bool result = await _uploadImageToServer();
      if (result) {
        await _divideUpdateCategory(UpdateCategoryRequest(
          id: dataRequest.id,
          name: state.controller.text.isEmpty
              ? dataRequest.name
              : state.controller.text,
          image: state.urlImage!,
        ));
      }
    } else if (state.fileImage == null &&
        state.controller.text != state.updateCategoryName) {
      emit(state.copyWith(updateCategoryStatus: CategoriesStatus.loading));
      await _divideUpdateCategory(UpdateCategoryRequest(
        id: dataRequest.id,
        name: state.updateCategoryName,
        image: dataRequest.image,
      ));
    }
  }

  Future<void> _divideUpdateCategory(UpdateCategoryRequest dataRequest) async {
    final either = await repository.updateCategory(
      request: UpdateCategoryRequest(
        id: dataRequest.id,
        name: dataRequest.name,
        image: dataRequest.image,
      ),
    );
    either.fold(
      (failure) => emit(state.copyWith(
        updateCategoryStatus: CategoriesStatus.failure,
        errorUpdateCategory: "Error update category Please try again...",
      )),
      (data) => emit(state.copyWith(
        updateCategoryStatus: CategoriesStatus.success,
      )),
    );
  }

  Future<bool> _uploadImageToServer() async {
    final result = await appUploadFile.uploadImage(state.fileImage!);
    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            uploadImageStatus: CategoriesStatus.failure,
            addCategoryStatus: CategoriesStatus.initial,
            updateCategoryStatus: CategoriesStatus.initial,
            errorUploadImage: "Wrong upload image Please try again...",
          ),
        );
        return false;
      },
      (data) {
        emit(state.copyWith(
          uploadImageStatus: CategoriesStatus.success,
          urlImage: data,
        ));
        return true;
      },
    );
  }
}
