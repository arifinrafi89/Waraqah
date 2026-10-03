/// Where the API lives.
///
/// Build with `--dart-define=API_BASE_URL=https://<host>/v1` to talk to the Go backend
/// (Android emulator: `http://10.0.2.2:8080/v1`). With no value the app keeps running on its
/// fake API: [useFakeApi] is true and no request ever leaves the app.
abstract final class ApiConfig {
  static const String _configured = String.fromEnvironment('API_BASE_URL');

  /// True when no real address was given, so `FakeApiInterceptor` answers every request.
  static const bool useFakeApi = _configured == '';

  /// A neutral placeholder while the fake API answers.
  static const String baseUrl = useFakeApi
      ? 'https://api.waraqah.local/v1'
      : _configured;

  static const Duration timeout = Duration(seconds: 12);
}
