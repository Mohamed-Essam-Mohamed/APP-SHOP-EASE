import 'dart:io';

import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/core/services/api/constant_api/constant_api.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:app_shop_ease/featuers/auth/data/graphql/auth_queries.dart';
import 'package:app_shop_ease/featuers/auth/data/model/request/login_request.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/login_response.dart';
import 'package:app_shop_ease/featuers/auth/data/model/response/user_data_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthApi {
  DioConsumer dio;
  AuthQueries authQueries;
  AuthApi({required this.dio, required this.authQueries});
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest request,
  }) async {
    try {
      final response = await dio.post(
        graphql,
        data: authQueries.loginQuery(request: request),
      );

      return Right(LoginResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserDataResponse>> userDataResponse(
      String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(
        "$baseUrl/api/v1/auth/profile",
      );
      return Right(UserDataResponse.fromJson(response.data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
