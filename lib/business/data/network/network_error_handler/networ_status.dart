import 'package:flutter/foundation.dart' show immutable;

enum NetworkResponseStatus {
  // success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectionTimeOut,
  cancel,
  recievTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  unknownError,
}

@immutable
class ApiInternalStatusCode {
  const ApiInternalStatusCode._();
  static const success = 0;
  static const failure = 1;
}
