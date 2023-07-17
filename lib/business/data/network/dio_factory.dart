import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable, kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tut_store_app/app_core/app_preference.dart';
import 'package:tut_store_app/app_core/constants.dart';

class DioFactory {
  final AppPreferences appPreferences;
  const DioFactory({
    required this.appPreferences,
  });

  Future<Dio> getDio() async {
    final dio = Dio();
    final language = await appPreferences.getAppLanguage();
    const duration = Duration(minutes: 1);
    final Map<String, dynamic> headers = {
      DioConstString.contentType: DioConstString.applicationJson,
      DioConstString.accept: DioConstString.applicationJson,
      DioConstString.authorization: Constant.token,
      DioConstString.defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      headers: headers,
      connectTimeout: duration,
      receiveTimeout: duration,
    );
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}

@immutable
class DioConstString {
  const DioConstString._();
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "authorization";
  static const String defaultLanguage = "language";
}
