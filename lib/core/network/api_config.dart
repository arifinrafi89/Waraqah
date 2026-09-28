/// Where the Go backend will live, and every route the app talks to.
///
/// This is a neutral placeholder: while `FakeApiInterceptor` is installed on
/// `dioProvider`, no request ever leaves the app. Going live later means
/// pointing this at the real Go service and removing the interceptor.
abstract final class ApiConfig {
  static const String baseUrl = 'https://api.waraqah.local/v1';
  static const Duration timeout = Duration(seconds: 12);
}

abstract final class ApiRoutes {
  static const String ayahOfTheDay = '/islamic/ayah-of-the-day';
  static const String books = '/books';
  static const String bites = '/bites';
  static const String p2pListings = '/p2p/listings';
  static const String aiChat = '/ai/chat';
}
