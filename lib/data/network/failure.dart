class Failure {
  final int statusCode;
  final String message;

  Failure(this.statusCode, this.message);

  @override
  String toString() {
    return 'Status [$statusCode] - $message';
  }
}
