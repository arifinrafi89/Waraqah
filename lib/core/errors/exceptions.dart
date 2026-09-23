/// Base exception class for all application exceptions.
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  @override
  String toString() => 'AppException: $message (code: $statusCode)';
}

class ServerException extends AppException {
  const ServerException([
    super.message = 'A server error occurred.',
    super.statusCode,
  ]);
}

class AuthException extends AppException {
  const AuthException([
    super.message = 'An authentication error occurred.',
    super.statusCode,
  ]);
}

class NetworkException extends AppException {
  const NetworkException([
    super.message = 'Please check your internet connection.',
  ]);
}
