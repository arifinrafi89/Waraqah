import 'package:go_router/go_router.dart';

import 'presentation/pages/donation_place_form_page.dart';

/// Admin → Donation places' sub-pages. [routes] are children of
/// `/admin/donations`, so the `/admin` guard covers them.
abstract final class DonateAdminRoutes {
  static const String places = '/admin/donations';

  /// The form for a new place.
  static const String newPlace = '$places/place';

  /// The form for an existing place.
  static String placeFor(String id) =>
      Uri(path: newPlace, queryParameters: {'id': id}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: 'place',
      builder: (_, state) =>
          DonationPlaceFormPage(id: state.uri.queryParameters['id'] ?? ''),
    ),
  ];
}
