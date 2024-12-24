import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/regsiter_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/login_response.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/resgister_response.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/user_data_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../data_source/auth_data_source.dart';

class AuthRepository extends Equatable {
  final AuthDataSource authDataSource;
  const AuthRepository({required this.authDataSource});

  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    return await authDataSource.login(request: request);
  }

  Future<Either<Failure, UserDataResponse>> userDataResponse(
    String token,
  ) async {
    return await authDataSource.userDataResponse(token);
  }

  Future<Either<Failure, RegisterResponse>> register({
    required RegisterRequest request,
  }) async {
    return await authDataSource.register(request: request);
  }

  @override
  List<Object?> get props => [authDataSource];
}
