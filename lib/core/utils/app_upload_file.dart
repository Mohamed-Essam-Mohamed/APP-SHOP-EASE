//? model upload
import 'dart:io';

import 'package:app_shop_ease/core/app/service_locator%20.dart';
import 'package:app_shop_ease/core/errors/failure.dart';
import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class UploadFileResponse {
  String? originalname;
  String? filename;
  String? location;

  UploadFileResponse({this.originalname, this.filename, this.location});

  UploadFileResponse.fromJson(Map<String, dynamic> json) {
    originalname = json['originalname'];
    filename = json['filename'];
    location = json['location'];
  }
}

// class UploadFileRequest {
//   UploadFileRequest({required this.file});
//   final XFile file;
// }

class AppUploadFile {
  static late ApiConsumer dio;
  AppUploadFile() {
    dio = sl<DioConsumer>();
  }

  static Future<Either<Failure, String?>> uploadImage(XFile image) async {
    try {
      var response = await dio.post(
        "/api/v1/files/upload",
        data: {
          "file": await uploadImage(image),
        },
        isFormData: true,
      );
      var data = UploadFileResponse.fromJson(response.data);
      return Right(data.location);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
