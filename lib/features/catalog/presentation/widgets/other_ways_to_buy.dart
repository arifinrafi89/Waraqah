import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../domain/entities/used_options.dart';
import '../providers/used_options_providers.dart';
import 'readers_row.dart';
import 'resale_note.dart';
import 'used_labels.dart';
import 'used_option_row.dart';

/// Under the new editions: Waraqah's Certified Used copy (into the cart),
/// readers' listings from the P2P marketplace (make the seller an offer),
/// and what the book resells for, so every way to get it is on one page.
class OtherWaysToBuy extends ConsumerWidget {
  const OtherWaysToBuy({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    // Start loading readers' listings now, alongside Waraqah's own copies.
    ref.watch(listingsForBookProvider(bookId));
    return AsyncView(
      value: ref.watch(usedOptionsProvider(bookId)),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(usedOptionsProvider(bookId)),
      skeleton: const ShimmerBox(height: 120, radius: Radii.card),
      builder: (options) => _Options(bookId: bookId, options: options),
    );
  }
}

class _Options extends ConsumerWidget {
  const _Options({required this.bookId, required this.options});

  final String bookId;
  final UsedOptions options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final certified = options.certifiedUsed;
    final listings = ref.watch(listingsForBookProvider(bookId)).value ?? [];
    final resale = options.resaleValueBdt;
    final hasCopies = certified != null || listings.isNotEmpty;
    if (!hasCopies && resale == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasCopies) SectionHeader(title: l10n.bookOtherWays),
        SurfaceCard(
          clip: true,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              children: [
                if (certified != null)
                  UsedOptionRow(
                    icon: Icons.verified_outlined,
                    title: l10n.cartCertifiedUsed,
                    detail:
                        '${l10n.conditionLabel(certified.condition)} · '
                        '${l10n.bookCertifiedNote}',
                    price: Bdt.format(certified.priceBdt),
                    trailing: IconButton(
                      tooltip: l10n.bookAddUsedToCart,
                      color: palette.accent,
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      onPressed: () => ref.addToCart(
                        context,
                        CartItemRef.certifiedUsed(certified.id),
                      ),
                    ),
                  ),
                if (listings.isNotEmpty) ReadersRow(listings: listings),
                if (resale != null) ResaleNote(valueBdt: resale),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
