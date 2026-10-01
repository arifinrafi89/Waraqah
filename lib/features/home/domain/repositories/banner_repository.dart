import '../entities/banner.dart';
import '../entities/season.dart';

/// Promo tiles at the top of Home, and the Season hero card above them.
abstract interface class BannerRepository {
  /// The active Season's Banners first, then the all-year ones.
  Future<List<Banner>> fetchBanners();

  /// The active Season, or `null` when none is on.
  Future<SeasonInfo?> fetchSeason();
}
