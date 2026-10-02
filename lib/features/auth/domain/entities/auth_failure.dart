/// Why an auth attempt was refused: bad input before it reached the server,
/// or a one-time code the server didn't accept.
enum AuthFailure implements Exception { invalidEmail, missingPassword, wrongCode }
