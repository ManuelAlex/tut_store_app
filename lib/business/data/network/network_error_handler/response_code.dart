import 'package:flutter/material.dart' show immutable;

@immutable
class ResponseCode {
  const ResponseCode._();
  // API status codes
  static const int success200 = 200; // success with data
  static const int noContent201 = 201; // success with no content
  static const int badRequest400 = 400; // failure, api rejected the request
  static const int forbidden403 = 403; // failure, api rejected the request
  static const int unAuthorised401 = 401; // failure user is not authorised
  static const int notFound404 =
      404; // failure, api url is not correct and not found
  static const int internalServerError500 =
      500; // failure, crash happened in server side

  // local status code
  static const int unknownError_1 = -1;
  static const int connectionTimeOut_2 = -2;
  static const int cancel_3 = -3;
  static const int recievTimeOut_4 = -4;
  static const int sendTimeOut_5 = -5;
  static const int cacheError_6 = -6;
  static const int noInternetConnection_7 = -7;
}
