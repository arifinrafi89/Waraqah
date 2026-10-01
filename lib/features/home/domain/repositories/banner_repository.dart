import '../entities/banner.dart';

/// Promo tiles at the top of Home.

abstract interface class BannerRepository {
  Future<List<Banner>> fetchBanners();
}
