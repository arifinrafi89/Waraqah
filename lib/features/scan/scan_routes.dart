import 'package:go_router/go_router.dart';

import 'presentation/pages/scan_page.dart';

abstract final class ScanRoutes {
  /// The barcode scanner: look a book up, or start a used Listing with it.
  static const String scan = '/scan';

  /// `?sell=1` when it was opened from the add-listing form, which gets
  /// the Book back.
  static String scanFor({bool sell = false}) => sell ? '$scan?sell=1' : scan;

  static final List<RouteBase> routes = [
    GoRoute(
      path: scan,
      builder: (_, state) =>
          ScanPage(forSell: state.uri.queryParameters['sell'] == '1'),
    ),
  ];
}
