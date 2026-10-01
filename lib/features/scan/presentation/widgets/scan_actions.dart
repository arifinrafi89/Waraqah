import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../p2p/p2p_routes.dart';
import '../../../p2p/presentation/providers/p2p_add_listing_notifier.dart';
import '../../domain/entities/scanned_book.dart';

/// Starting a used Listing from the scanner.
extension ScanActions on WidgetRef {
  /// With [forSell], hands [book] back to the add-listing form that opened
  /// the scanner. Otherwise opens a new form with it filled in, or an empty
  /// one when there's no [book].
  void sellCopy(
    BuildContext context,
    ScannedBook? book, {
    bool forSell = false,
  }) {
    if (forSell) {
      context.pop(book);
      return;
    }
    invalidate(p2pAddListingProvider);
    if (book != null) {
      read(p2pAddListingProvider.notifier)
          .fromBook(book.bookId, book.title, newPriceBdt: book.newPriceBdt);
    }
    context.pushReplacement(P2pRoutes.addListing);
  }
}
