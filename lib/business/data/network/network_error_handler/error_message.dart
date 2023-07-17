import 'package:flutter/material.dart' show immutable;

import 'response_string.dart';

@immutable
class ResponseMessage {
  // API status codes
  // API response codes
  static const String success = ResponseString.success; // success with data
  static const String noContent =
      ResponseString.noContent; // success with no content
  static const String badRequest =
      ResponseString.badRequestError; // failure, api rejected our request
  static const String forbidden =
      ResponseString.forbiddenError; // failure,  api rejected our request
  static const String unAuthorised =
      ResponseString.unAuthorisedError; // failure, user is not authorised
  static const String notFound = ResponseString
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String internalServerError = ResponseString
      .internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String unknownError =
      ResponseString.notFoundError; // unknown error happened
  static const String connectionTimeOut =
      ResponseString.timeoutError; // issue in connectivity
  static const String cancel =
      ResponseString.unKnownError; // API request was cancelled
  static const String recievTimeOut =
      ResponseString.timeoutError; //  issue in connectivity
  static const String sendTimeOut =
      ResponseString.timeoutError; //  issue in connectivity
  static const String cacheError = ResponseString
      .unKnownError; //  issue in getting data from local data source (cache)
  static const String noInternetConnection =
      ResponseString.noInternetError; // issue in connectivity
}
