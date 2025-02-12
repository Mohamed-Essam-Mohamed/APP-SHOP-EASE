import 'dart:async';
import 'dart:developer';

import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';
import 'package:app_shop_ease/featuers/auth/data/repository/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_shared_preference.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginBloc({required this.authRepository}) : super(LoginStateInitial()) {
    on<LoginAppEvent>((event, emit) async {
      if (formKey.currentState!.validate()) {
        emit(LoginStateLoading());
        //? Await the login operation
        var eitherLogin = await authRepository.login(
          request: LoginRequest(
            email: emailController.text.trim(),
            password: passwordController.text,
          ),
        );

        await eitherLogin.fold(
          (ifLeft) async {
            emit(LoginStateError(ifLeft.message));
          },
          (responseLogin) async {
            String token = responseLogin.data!.login!.accessToken!;
            var eitherUserData = await authRepository.userDataResponse(token);
            await eitherUserData.fold(
              (ifLeft) async {
                emit(LoginStateError(ifLeft.message));
              },
              (responseUserData) async {
                // Save user data to SharedPreferences
                await SharedPreferencesUtils.savePref(responseUserData);
                log("role ${responseUserData.role}");
                emit(LoginStateSuccess(responseUserData.role ?? "user"));
              },
            );
          },
        );
      }
    });
  }
}
