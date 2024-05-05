// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'failure.dart';

enum DefinedError {
  CONNECT_TIMEOUT(800, ErrorStrings.CONNECT_TIMEOUT),
  CANCEL(801, ErrorStrings.CANCEL),
  RECEIVE_TIMEOUT(802, ErrorStrings.RECEIVE_TIMEOUT),
  SEND_TIMEOUT(803, ErrorStrings.SEND_TIMEOUT),
  CACHE_ERROR(804, ErrorStrings.CACHE_ERROR),
  NO_INTERNET_CONNECTION(805, ErrorStrings.NO_INTERNET_CONNECTION),
  BAD_CERTIFICATE(806, ErrorStrings.BAD_CERTIFICATE),

  /// Caused for example by a `xhr.onError` or SocketExceptions.
  CONNECTION_ERROR(807, ErrorStrings.CONNECTION_ERROR),

  DEFAULT(999, ErrorStrings.DEFAULT);

  const DefinedError(this.statusCode, this.message);

  final int statusCode;
  final String message;

  Failure get failure => Failure(statusCode, message);
}

enum BadResponseError {
  NO_CONTENT(201, ErrorStrings.NO_CONTENT),
  BAD_REQUEST(400, ErrorStrings.BAD_REQUEST),
  FORBIDDEN(403, ErrorStrings.FORBIDDEN),
  UNAUTHORISED(401, ErrorStrings.UNAUTHORISED),
  NOT_FOUND(404, ErrorStrings.NOT_FOUND),
  INTERNAL_SERVER_ERROR(500, ErrorStrings.INTERNAL_SERVER_ERROR);

  const BadResponseError(this.statusCode, this.message);

  final int statusCode;
  final String message;

  Failure get failure => Failure(statusCode, message);
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DefinedError.DEFAULT.failure;
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DefinedError.CONNECT_TIMEOUT.failure;
      case DioExceptionType.sendTimeout:
        return DefinedError.SEND_TIMEOUT.failure;
      case DioExceptionType.receiveTimeout:
        return DefinedError.RECEIVE_TIMEOUT.failure;
      case DioExceptionType.badCertificate:
        return DefinedError.BAD_CERTIFICATE.failure;
      case DioExceptionType.badResponse:
        if (error.response != null && error.response!.statusCode != null) {
          for (var err in BadResponseError.values) {
            if (err.statusCode == error.response!.statusCode!) {
              return err.failure;
            }
          }
        }
        return DefinedError.DEFAULT.failure;
      case DioExceptionType.cancel:
        return DefinedError.CANCEL.failure;
      case DioExceptionType.connectionError:
        return DefinedError.CONNECTION_ERROR.failure;
      case DioExceptionType.unknown:
      default:
        return DefinedError.DEFAULT.failure;
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
  static const String BAD_CERTIFICATE = "Incorrect certificate";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
  static const String CONNECTION_ERROR = "Cannot connect to server.";
}

enum APIInternalStatus {
  fail(0),
  success(1);

  final int statusCode;

  const APIInternalStatus(this.statusCode);
}
