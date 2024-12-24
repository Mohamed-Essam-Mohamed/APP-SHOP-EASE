import 'dart:async';

import 'package:app_shop_ease/featuers/auth/data/model/request/regsiter_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository authRepository;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterAppEvent>(
      (event, emit) async {
        if (formKey.currentState!.validate()) {
          emit(RegisterLoading());
          var either = await authRepository.register(
            request: RegisterRequest(
              email: emailController.text,
              password: passwordController.text,
              name: nameController.text,
            ),
          );
          either.fold(
            (fail) => emit(RegisterError(message: fail.message)),
            (response) => emit(RegisterSuccess()),
          );
        }
      },
    );
  }
}
