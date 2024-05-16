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
  static const String UNKNOWN = 'An unknown exception occurred.';
}
