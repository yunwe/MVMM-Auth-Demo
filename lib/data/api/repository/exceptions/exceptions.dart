// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

//import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:mvmm_auth_demo/data/api/datasource/models/models.dart';
import 'package:mvmm_auth_demo/data/api/repository/exceptions/error_strings.dart';
import 'package:mvmm_auth_demo/domain/repository/exceptions.dart';

class DioExceptionsFailure extends BaseException {
  /// {@macro sign_up_with_email_and_password_failure}
  const DioExceptionsFailure([
    super.message = ErrorStrings.UNKNOWN,
  ]);

  factory DioExceptionsFailure.fromDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const DioExceptionsFailure(ErrorStrings.CONNECTION_ERROR);
      case DioExceptionType.sendTimeout:
        return const DioExceptionsFailure(ErrorStrings.SEND_TIMEOUT);
      case DioExceptionType.receiveTimeout:
        return const DioExceptionsFailure(ErrorStrings.RECEIVE_TIMEOUT);
      case DioExceptionType.badCertificate:
        return const DioExceptionsFailure(ErrorStrings.BAD_CERTIFICATE);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case 201:
            return const DioExceptionsFailure(ErrorStrings.NO_CONTENT);
          case 400:
            return const DioExceptionsFailure(ErrorStrings.BAD_REQUEST);
          case 401:
            return const DioExceptionsFailure(ErrorStrings.UNAUTHORISED);
          case 403:
            return const DioExceptionsFailure(ErrorStrings.FORBIDDEN);
          case 404:
            return const DioExceptionsFailure(ErrorStrings.NOT_FOUND);
          case 500:
            return const DioExceptionsFailure(ErrorStrings.INTERNAL_SERVER_ERROR);
          default:
            return const DioExceptionsFailure();
        }
      case DioExceptionType.cancel:
        return const DioExceptionsFailure(ErrorStrings.CANCEL);
      case DioExceptionType.connectionError:
        return const DioExceptionsFailure(ErrorStrings.CONNECTION_ERROR);
      case DioExceptionType.unknown:
      default:
        return const DioExceptionsFailure();
    }
  }
}

class ConnectionFailure extends BaseException {
  /// {@macro sign_up_with_email_and_password_failure}
  const ConnectionFailure([
    super.message = ErrorStrings.NO_INTERNET_CONNECTION,
  ]);
}

class DomainLogicFailure extends BaseException {
  /// {@macro sign_up_with_email_and_password_failure}
  const DomainLogicFailure([
    super.message = ErrorStrings.UNKNOWN,
  ]);

  factory DomainLogicFailure.fromRespnse(BaseResponse response) {
    if (response.message.isEmpty) {
      return const DomainLogicFailure();
    }
    return DomainLogicFailure(response.message);
  }
}
