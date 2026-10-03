// The fake backend files a Listing under the catalog's Categories, so it
// reads the catalog's fixtures directly (the Go backend joins the tables).
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/category_fixtures.dart';
import '../models/p2p_listing_model.dart';

/// Fills in a Listing's Category from its catalog Book when it has none,
/// and the Section that Category belongs to.
P2pListingModel withCatalogCategory(P2pListingModel listing) {
  final categoryId =
      listing.categoryId ??
      BookFixtures.all
          .where((b) => b.id == listing.bookId)
          .firstOrNull
          ?.categoryId;
  final category = CategoryFixtures.all
      .where((c) => c.id == categoryId)
      .firstOrNull;
  return listing.copyWith(categoryId: categoryId, section: category?.section);
}
