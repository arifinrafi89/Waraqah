import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../p2p/data/p2p_providers.dart';
import '../../../p2p/domain/models/p2p_listing.dart';

/// The current user's own listings, unfiltered by status — unlike the public
/// P2P feed, reserved/sold listings still show here.
final myListingsProvider = FutureProvider<List<P2pListing>>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final listings = await ref.watch(p2pListingsProvider.future);
  return listings.where((listing) => listing.sellerId == profile.id).toList();
});

/// Profile page: current user plus their listings and the book/seller
/// lookups the listings grid renders with.
final profilePageProvider = FutureProvider<
    ({
      Profile profile,
      List<P2pListing> listings,
      Map<String, Book> books,
      Map<String, Profile> profiles,
    })>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final listings = await ref.watch(myListingsProvider.future);
  final books = {
    for (final b in await ref.watch(booksProvider.future)) b.id: b,
  };
  final profiles = {
    for (final p in await ref.watch(profilesProvider.future)) p.id: p,
  };
  return (profile: profile, listings: listings, books: books, profiles: profiles);
});
