import 'package:go_router/go_router.dart';

import 'presentation/pages/donate_page.dart';
import 'presentation/pages/recipient_page.dart';

/// Anyone can look; donating asks a guest to log in first.
abstract final class DonateRoutes {
  static const String donate = '/donate';

  static String recipientFor(String id) => '$donate/recipient/$id';

  static final List<RouteBase> routes = [
    GoRoute(path: donate, builder: (_, _) => const DonatePage()),
    GoRoute(
      path: '$donate/recipient/:id',
      builder: (_, state) =>
          RecipientPage(id: state.pathParameters['id'] ?? ''),
    ),
  ];
}
