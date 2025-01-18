import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/auth/data/api/api_auth.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/regsiter_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/resgister_response.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/user_data_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../model/response/login_response.dart';

class AuthDataSource extends Equatable {
  final AuthApi authApi;
  const AuthDataSource({required this.authApi});

  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    var either = await authApi.login(request: request);
    return either.fold((fail) => Left(ServerFailure(fail.message)),
        (response) => Right(response));
  }

  Future<Either<Failure, UserDataResponse>> userDataResponse(
      String token) async {
    var either = await authApi.userDataResponse(token);
    return either.fold((fail) => Left(ServerFailure(fail.message)),
        (response) => Right(response));
  }

  Future<Either<Failure, RegisterResponse>> register({
    required RegisterRequest request,
  }) async {
    var either = await authApi.register(request: request);
    return either.fold(
      (fail) => Left(ServerFailure(fail.message)),
      (response) => Right(response),
    );
  }

  @override
  List<Object?> get props => [authApi];
}
