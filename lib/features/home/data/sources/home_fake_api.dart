import 'package:dio/dio.dart';

import '../../domain/entities/season.dart';
import 'banner_fixtures.dart';
import 'season_fixtures.dart';
import 'season_picker.dart';

/// Home's own fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Both take an optional `?date=yyyy-mm-dd`
/// (default: today) to pick the Season.
abstract final class HomeFakeApi {
  /// The active Season's Banners first, then the all-year ones, in display
  /// order. Other Seasons' Banners are left out.
  static const String banners = '/home/banners';

  /// The active Season's hero card, or `null` when none is on.
  static const String season = '/home/season';

  /// [override] reads the Season Staff forced (Admin → Catalog), `null` for
  /// automatic; it lives in the admin fake store.
  static Map<String, Object? Function(RequestOptions)> routes(
    Season? Function() override,
  ) {
    Season? active(RequestOptions options) {
      final date = options.queryParameters['date'] as String?;
      return SeasonPicker.activeOn(
        date == null ? DateTime.now() : DateTime.parse(date),
        override: override(),
      );
    }

    return {
      banners: (options) {
        final now = active(options);
        return [
          for (final b in BannerFixtures.all)
            if (now != null && b.season == now) b.toJson(),
          for (final b in BannerFixtures.all)
            if (b.season == null) b.toJson(),
        ];
      },
      season: (options) => SeasonFixtures.info[active(options)]?.toJson(),
    };
  }
}
