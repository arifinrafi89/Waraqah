import 'dart:async';

/// The signed-in session's tokens, as the network layer sees them.
///
/// `core/` never imports a feature, so Auth implements this and the composition root hands it to
/// [AuthInterceptor].
abstract interface class SessionTokens {
  /// The access token to send as `Authorization: Bearer …`, or `null` for a guest.
  String? get accessToken;

  /// Trades the refresh token for new tokens, keeps them, and returns the new access token.
  /// `null` when there is no refresh token or the server refused it (the session then ends).
  Future<String?> refresh();
}

/// Tells the app a session ended because its refresh token was refused, so it can sign out.
class SessionExpiry {
  final StreamController<void> _controller = StreamController<void>.broadcast();

  Stream<void> get stream => _controller.stream;

  void expire() => _controller.add(null);
}
