import 'dart:developer';

import 'package:app_shop_ease/core/utils/app_upload_file.dart';
import 'package:app_shop_ease/featuers/admin/data/model/request/categories/create_category_request.dart';
import 'package:app_shop_ease/featuers/admin/data/model/response/categories/all_category_response.dart';
import 'package:app_shop_ease/featuers/admin/data/repository/repository/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.repository}) : super(CategoriesState());
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

  void updateCategoryImage(XFile iamge) {
    emit(state.copyWith(uploadImageStatus: CategoriesStatus.loading));
    emit(state.copyWith(
        uploadImageStatus: CategoriesStatus.success, image: iamge));
  }

  Future<void> createCategory() async {
    emit(state.copyWith(createCategoryStatus: CategoriesStatus.loading));

    if (state.formKey.currentState!.validate()) {
      if (state.image == null) {
        emit(state.copyWith(
          createCategoryStatus: CategoriesStatus.failure,
          errorCreateCategory: "Please select image",
        ));
        return;
      }

      await uploadImage();

      final result = await repository.createCategory(
        CreateCategoryRequest(
          name: state.controller.text,
          image: state.urlImage,
        ),
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            createCategoryStatus: CategoriesStatus.failure,
            errorCreateCategory: failure.message,
          ),
        ),
        (data) => emit(
          state.copyWith(
            createCategoryStatus: CategoriesStatus.success,
          ),
        ),
      );
    }
  }

  Future<void> uploadImage() async {
    emit(state.copyWith(getUrlImageStatus: CategoriesStatus.loading));
    final result = await AppUploadFile.uploadImage(state.image!);
    result.fold(
      (failure) => emit(
        state.copyWith(
          getUrlImageStatus: CategoriesStatus.failure,
          errorGetUrlImage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          getUrlImageStatus: CategoriesStatus.success,
          urlImage: data,
        ),
      ),
    );
  }
}
