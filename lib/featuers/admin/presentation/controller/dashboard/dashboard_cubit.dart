import 'package:app_shop_ease/featuers/admin/data/repository/repository/dashboard_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.repository}) : super(const DashboardState());
  DashboardRepository repository;
  //? get all products
  Future<void> getAllProducts() async {
    emit(state.copyWith(productState: RequestStatus.loading));
    final result = await repository.getAllProducts();
    result.fold(
      (failure) => emit(
        state.copyWith(
          productState: RequestStatus.failure,
          errorProduct: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          productState: RequestStatus.success,
          productCount: data.data?.products?.length ?? 0,
        ),
      ),
    );
  }

  //? get all categories
  Future<void> getAllCategories() async {
    emit(state.copyWith(categoryState: RequestStatus.loading));
    final result = await repository.getAllCategories();
    result.fold(
      (failure) => emit(
        state.copyWith(
          categoryState: RequestStatus.failure,
          errorCategory: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          categoryState: RequestStatus.success,
          categoryCount: data.data?.categories?.length ?? 0,
        ),
      ),
    );
  }

  //? get all users
  Future<void> getAllUsers() async {
    emit(state.copyWith(userState: RequestStatus.loading));
    final result = await repository.getAllUsers();
    result.fold(
      (failure) => emit(
        state.copyWith(
          userState: RequestStatus.failure,
          errorUser: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          userState: RequestStatus.success,
          userCount: data.data?.users?.length ?? 0,
        ),
      ),
    );
  }
}
