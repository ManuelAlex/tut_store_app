import 'package:flutter/foundation.dart' show immutable;

@immutable
class ResponseString {
  const ResponseString._();

  static const String success = "success";
  static const String noContent = "noContent";
  static const String badRequestError = "badRequestError";
  static const String forbiddenError = "forbidden";
  static const String unAuthorisedError = "unAuthorised";
  static const String notFoundError = "notFoundError";
  static const String internalServerError = "internalServerError";
  static const String unKnownError = "UnKnow Error";
  static const String timeoutError = "Timeout Error";
  static const String noInternetError = "No Internet Error";
}
