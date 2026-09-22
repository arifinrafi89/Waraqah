/// Where the Go backend lives, and every route the app talks to.
///
/// The Go service ships from its own repository, so until it is deployed the
/// data sources fall back to bundled fixtures (see `*_local_source.dart`).
abstract final class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:8080/api/v1';
  static const Duration timeout = Duration(seconds: 12);
}

abstract final class ApiRoutes {
  static const String ayahOfTheDay = '/islamic/ayah-of-the-day';
  static const String books = '/books';
  static const String bites = '/bites';
  static const String p2pListings = '/p2p/listings';
  static const String aiChat = '/ai/chat';
}
