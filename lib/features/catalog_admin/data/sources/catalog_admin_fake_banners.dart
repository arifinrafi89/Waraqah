// Edits Home's Banner fixtures in place; see CatalogAdminFakeStore.
import '../../../home/data/models/banner_model.dart';
import '../../../home/data/sources/banner_fixtures.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import 'catalog_admin_fake_store.dart';

/// Staff's changes to Home's Banners on the fake backend. Each answers
/// every Banner in display order, or `null` when refused.
abstract final class CatalogAdminFakeBanners {
  static List<Map<String, dynamic>> get all => [
    for (final b in BannerFixtures.all) b.toJson(),
  ];

  /// Adds (empty `id`) or updates a Banner.
  static Object? save(Map<String, dynamic> json) {
    var banner = BannerModel.fromJson({...json, 'id': json['id'] ?? ''});
    if (CatalogAdminRules.banner(banner.toEntity()).isNotEmpty) return null;
    final ids = [for (final b in BannerFixtures.all) b.id];
    if (banner.id.isEmpty) {
      final id = CatalogAdminFakeStore.uniqueId('ban', banner.titleEn, ids);
      BannerFixtures.all.add(banner = banner.copyWith(id: id));
    } else if (ids.contains(banner.id)) {
      BannerFixtures.all[ids.indexOf(banner.id)] = banner;
    } else {
      return null;
    }
    return all;
  }

  static Object? delete(String id) {
    final before = BannerFixtures.all.length;
    BannerFixtures.all.removeWhere((b) => b.id == id);
    return BannerFixtures.all.length < before ? all : null;
  }

  /// One place up ([by] = -1) or down (1).
  static Object? move(String id, int by) {
    final from = BannerFixtures.all.indexWhere((b) => b.id == id);
    final to = from + by;
    if (from < 0 || to < 0 || to >= BannerFixtures.all.length) return null;
    BannerFixtures.all.insert(to, BannerFixtures.all.removeAt(from));
    return all;
  }
}
