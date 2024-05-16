import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvmm_auth_demo/app/setting.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeOut = const Duration(milliseconds: 60 * 1000); // 1 min
    //  String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Setting.token,
      DEFAULT_LANGUAGE: Setting.language,
    };

    dio.options = BaseOptions(
      baseUrl: Setting.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
