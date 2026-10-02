import 'package:go_router/go_router.dart';

import 'presentation/pages/bite_compose_page.dart';
import 'presentation/pages/bites_page.dart';

abstract final class BitesRoutes {
  static const String bites = '/bites';

  /// The composer. Signed-in only (see `RouteAccess.signedInOnly`).
  static const String compose = '/bites/compose';

  /// The composer editing Bite [id], or pre-tagged with [bookId].
  static String composeFor({String? id, String? bookId}) => Uri(
    path: compose,
    queryParameters: {'id': ?id, 'bookId': ?bookId},
  ).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: compose,
      builder: (_, state) => BiteComposePage(
        id: state.uri.queryParameters['id'],
        bookId: state.uri.queryParameters['bookId'],
      ),
    ),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: bites, builder: (_, _) => const BitesPage())],
  );
}
