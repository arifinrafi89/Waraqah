import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../p2p/p2p_routes.dart';
import '../../../p2p/presentation/providers/p2p_add_listing_notifier.dart';
import '../../../sell_back/domain/entities/sell_back.dart';
import '../../../sell_back/sell_back_routes.dart';
import 'finished_it_sheet.dart';

/// "Finished it? Sell it". The shelves call [bookFinished] when a
/// reader marks a book Finished.
extension FinishedItActions on WidgetRef {
  /// Suggests selling the book the reader just finished.
  Future<void> bookFinished(BuildContext context, String bookId) =>
      showFinishedItSheet(context, bookId);

  /// The add-listing form with the book filled in, read once (Like New).
  void listFinished(BuildContext context, SellBackBook book) {
    invalidate(p2pAddListingProvider);
    read(p2pAddListingProvider.notifier)
      ..fromBook(book.bookId, book.title, newPriceBdt: book.newPriceBdt)
      ..updateCondition(BookCondition.likeNew);
    Navigator.pop(context);
    context.push(P2pRoutes.addListing);
  }

  /// Sell Back's quote, starting from the book.
  void sellBackFinished(BuildContext context, SellBackBook book) {
    Navigator.pop(context);
    context.push(SellBackRoutes.sellBackFor(book.bookId));
  }
}
