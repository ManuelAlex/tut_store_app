import 'package:dio/dio.dart';
import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/get_failure_extention.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/response_code.dart';

import 'networ_status.dart';

class Errorhandler implements Exception {
  late Failure failure;
  Errorhandler.handle({
    required dynamic error,
  }) {
    if (error is DioException) {
      failure = _errorHandler(error);
    }
    failure = NetworkResponseStatus.unknownError.getFailure();
  }
}

Failure _errorHandler(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkResponseStatus.connectionTimeOut.getFailure();

    case DioExceptionType.sendTimeout:
      return NetworkResponseStatus.sendTimeOut.getFailure();

    case DioExceptionType.receiveTimeout:
      return NetworkResponseStatus.recievTimeOut.getFailure();

    case DioExceptionType.badResponse:
      switch (dioException.response?.statusCode) {
        case ResponseCode.badRequest400:
          return NetworkResponseStatus.badRequest.getFailure();
        case ResponseCode.forbidden403:
          return NetworkResponseStatus.forbidden.getFailure();
        case ResponseCode.internalServerError500:
          return NetworkResponseStatus.internalServerError.getFailure();
        case ResponseCode.notFound404:
          return NetworkResponseStatus.notFound.getFailure();
        case ResponseCode.unAuthorised401:
          return NetworkResponseStatus.unAuthorized.getFailure();
        case ResponseCode.unknownError_1:
          return NetworkResponseStatus.unknownError.getFailure();
        default:
          return NetworkResponseStatus.unknownError.getFailure();
      }

    case DioExceptionType.cancel:
      return NetworkResponseStatus.cancel.getFailure();

    case DioExceptionType.unknown:
      return NetworkResponseStatus.unknownError.getFailure();

    default:
      return NetworkResponseStatus.unknownError.getFailure();
  }
}
