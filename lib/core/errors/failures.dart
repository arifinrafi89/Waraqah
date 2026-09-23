/// Immutable failure classes mapped from exceptions for presentation consumption.
abstract class Failure {
  final String message;
  final int? code;

  const Failure(this.message, [this.code]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          code == other.code;

  @override
  int get hashCode => message.hashCode ^ code.hashCode;

  @override
  String toString() => '$runtimeType(message: $message, code: $code)';
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred.', super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failed.', super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network connection issue.']);
}
