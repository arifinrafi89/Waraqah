import '../../domain/entities/p2p_listing.dart';
import '../../domain/entities/seller_profile.dart';
import '../../domain/repositories/p2p_repository.dart';
import '../models/p2p_listing_model.dart';
import '../models/seller_profile_model.dart';
import '../sources/p2p_remote_source.dart';

/// No cache: a listing can be reserved or sold at any moment, and the
/// server owns that.
class P2pRepositoryImpl implements P2pRepository {
  P2pRepositoryImpl(this._source);

  final P2pRemoteSource _source;

  @override
  Future<List<P2pListing>> fetchListings({
    bool onlyAvailable = false,
    int? limit,
  }) async => [
    for (final listing in await _source.listings(
      onlyAvailable: onlyAvailable,
      limit: limit,
    ))
      listing.toEntity(),
  ];

  @override
  Future<List<P2pListing>> fetchMyListings() async => [
    for (final listing in await _source.mine()) listing.toEntity(),
  ];

  @override
  Future<P2pListing?> fetchListing(String id) async =>
      (await _source.listing(id))?.toEntity();

  @override
  Future<List<P2pListing>> fetchListingsForBook(String bookId) async => [
    for (final listing in await _source.forBook(bookId)) listing.toEntity(),
  ];

  @override
  Future<SellerProfile?> fetchSeller(String id) async =>
      (await _source.seller(id))?.toEntity();
}
