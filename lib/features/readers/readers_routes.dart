import 'package:go_router/go_router.dart';

import 'presentation/pages/reader_page.dart';

abstract final class ReadersRoutes {
  /// A Reader's public page; open to guests.
  static const String reader = '/readers';

  static String readerFor(String id) =>
      Uri(path: reader, queryParameters: {'id': id}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: reader,
      builder: (_, state) =>
          ReaderPage(id: state.uri.queryParameters['id'] ?? ''),
    ),
  ];
}
