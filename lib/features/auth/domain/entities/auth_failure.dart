/// Why a sign-in attempt was refused before it reached the server.
enum AuthFailure implements Exception { invalidEmail, missingPassword }
