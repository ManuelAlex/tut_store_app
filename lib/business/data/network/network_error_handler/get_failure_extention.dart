import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/error_message.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/networ_status.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/response_code.dart';

extension GetNetworkResponseStatus on NetworkResponseStatus {
  Failure getFailure() {
    switch (this) {
      case NetworkResponseStatus.badRequest:
        return const Failure(
          code: ResponseCode.badRequest400,
          message: ResponseMessage.badRequest,
        );
      case NetworkResponseStatus.noContent:
        return const Failure(
          code: ResponseCode.noContent201,
          message: ResponseMessage.noContent,
        );
      case NetworkResponseStatus.forbidden:
        return const Failure(
          code: ResponseCode.forbidden403,
          message: ResponseMessage.forbidden,
        );
      case NetworkResponseStatus.unAuthorized:
        return const Failure(
          code: ResponseCode.unAuthorised401,
          message: ResponseMessage.unAuthorised,
        );
      case NetworkResponseStatus.notFound:
        return const Failure(
          code: ResponseCode.noContent201,
          message: ResponseMessage.notFound,
        );
      case NetworkResponseStatus.internalServerError:
        return const Failure(
          code: ResponseCode.internalServerError500,
          message: ResponseMessage.internalServerError,
        );
      case NetworkResponseStatus.connectionTimeOut:
        return const Failure(
          code: ResponseCode.connectionTimeOut_2,
          message: ResponseMessage.connectionTimeOut,
        );
      case NetworkResponseStatus.cancel:
        return const Failure(
          code: ResponseCode.cancel_3,
          message: ResponseMessage.cancel,
        );
      case NetworkResponseStatus.recievTimeOut:
        return const Failure(
          code: ResponseCode.recievTimeOut_4,
          message: ResponseMessage.recievTimeOut,
        );
      case NetworkResponseStatus.sendTimeOut:
        return const Failure(
          code: ResponseCode.sendTimeOut_5,
          message: ResponseMessage.sendTimeOut,
        );
      case NetworkResponseStatus.cacheError:
        return const Failure(
          code: ResponseCode.cacheError_6,
          message: ResponseMessage.cacheError,
        );
      case NetworkResponseStatus.noInternetConnection:
        return const Failure(
          code: ResponseCode.noInternetConnection_7,
          message: ResponseMessage.noInternetConnection,
        );
      case NetworkResponseStatus.unknownError:
        return const Failure(
          code: ResponseCode.unknownError_1,
          message: ResponseMessage.unknownError,
        );
    }
  }
}
