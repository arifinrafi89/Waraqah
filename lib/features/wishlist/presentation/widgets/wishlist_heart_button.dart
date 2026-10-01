import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/wishlist_providers.dart';
import 'wishlist_action.dart';

/// Heart for a book's top bar: filled when the book is saved.
class WishlistHeartButton extends ConsumerWidget {
  const WishlistHeartButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final saved = ref.watch(isWishlistedProvider(book.id));
    return AppIconButton(
      icon: saved ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      tooltip: saved ? l10n.wishlistRemove : l10n.wishlistSave,
      onPressed: () =>
          ref.setWishlisted(context, book.id, saved: !saved, book: book),
    );
  }
}
