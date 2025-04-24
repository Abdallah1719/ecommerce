import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/error/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 401: //unauthorized
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 403: //forbidden
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 404: //not found
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 409: //cofficient
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 422: //  Unprocessable Entity
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
        case 504: // Server exception
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          );
      }
  }
}
