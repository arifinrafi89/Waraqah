import 'package:go_router/go_router.dart';

import 'presentation/pages/inbox_page.dart';
import 'presentation/pages/thread_page.dart';

/// Offers and conversations about used books. Signed-in only (see
/// `RouteAccess.signedInOnly`).
abstract final class InboxRoutes {
  static const String inbox = '/p2p/inbox';

  static String threadFor(String id) => '$inbox/$id';

  static final List<RouteBase> routes = [
    GoRoute(path: inbox, builder: (_, _) => const InboxPage()),
    GoRoute(
      path: '$inbox/:id',
      builder: (_, state) => ThreadPage(id: state.pathParameters['id'] ?? ''),
    ),
  ];
}
