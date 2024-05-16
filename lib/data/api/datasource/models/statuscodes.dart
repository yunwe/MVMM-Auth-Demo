enum APIInternalStatus {
  fail(0),
  success(1);

  final int statusCode;

  const APIInternalStatus(this.statusCode);
}
