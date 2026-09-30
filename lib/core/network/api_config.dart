/// Where the Go backend will live.
///
/// This is a neutral placeholder: while `FakeApiInterceptor` is installed on
/// `dioProvider`, no request ever leaves the app. Going live later means
/// pointing this at the real Go service and removing the interceptor.
abstract final class ApiConfig {
  static const String baseUrl = 'https://api.waraqah.local/v1';
  static const Duration timeout = Duration(seconds: 12);
}
