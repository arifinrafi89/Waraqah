/// Why an auth attempt was refused: bad input before it reached the server,
/// or a one-time code the server didn't accept.
enum AuthFailure implements Exception {
  invalidEmail,
  missingPassword,
  wrongCode,

  /// The server refused the email and password.
  wrongCredentials,

  /// The server refused the Google sign-in.
  googleFailed,

  /// The server would not start the sign-up (an address that is already registered).
  signUpRefused,
}
