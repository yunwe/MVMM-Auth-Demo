import 'package:dio/dio.dart';
import 'package:mvmm_auth_demo/data/network/failure.dart';
import 'package:retrofit/retrofit.dart';

const NOT_DIO_EXCEPTION = -100;
const UNDEFINE_DIO_EXCEPTION = -200;

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = Failure(NOT_DIO_EXCEPTION, ErrorStrings.DEFAULT);
    }
  }

  Failure _handleError(DioException error) {
    int statusCode = error.response?.statusCode ?? UNDEFINE_DIO_EXCEPTION;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(statusCode, ErrorStrings.CONNECT_TIMEOUT);
      case DioExceptionType.sendTimeout:
        return Failure(statusCode, ErrorStrings.SEND_TIMEOUT);
      case DioExceptionType.receiveTimeout:
        return Failure(statusCode, ErrorStrings.RECEIVE_TIMEOUT);
      case DioExceptionType.cancel:
        return Failure(statusCode, ErrorStrings.CANCEL);
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

class ErrorStrings {
  // API status codes
  static const String NO_CONTENT = "success with no content"; // success with no content
  static const String BAD_REQUEST = "Bad request, try again later"; // failure, api rejected the request
  static const String FORBIDDEN = "forbidden request, try again later"; // failure, api rejected the request
  static const String UNAUTHORISED = "user is unauthorised, try again later"; // failure user is not authorised
  static const String NOT_FOUND = "Url is not found, try again later"; // failure, api url is not correct and not found
  static const String INTERNAL_SERVER_ERROR = "some thing went wrong, try again later"; // failure, crash happened in server side

  // local status code
  static const String DEFAULT = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
}
