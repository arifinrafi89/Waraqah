import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

part 'shared_wishlist.freezed.dart';

/// A reader's wishlist as friends see it through its link: whose it is and
/// the books on it, newest first. Friends can't change it.
@freezed
abstract class SharedWishlist with _$SharedWishlist {
  const factory SharedWishlist({
    /// Goes in the link: `/wishlist/shared/<id>`.
    required String id,
    required String ownerName,
    required List<Book> books,
  }) = _SharedWishlist;
}
