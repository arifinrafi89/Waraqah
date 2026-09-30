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
import '../../domain/entities/used_options.dart';
import '../providers/used_options_providers.dart';
import 'resale_note.dart';
import 'used_labels.dart';
import 'used_listings_sheet.dart';
import 'used_option_row.dart';

/// Under the new editions: Certified Used, readers' copies, and what the
/// book resells for, so every way to buy it is on one page.
class OtherWaysToBuy extends ConsumerWidget {
  const OtherWaysToBuy({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(usedOptionsProvider(bookId)),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(usedOptionsProvider(bookId)),
      skeleton: const ShimmerBox(height: 120, radius: Radii.card),
      builder: (options) => _Options(options: options),
    );
  }
}

class _Options extends ConsumerWidget {
  const _Options({required this.options});

  final UsedOptions options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final certified = options.certifiedUsed;
    final cheapest = options.cheapestListing;
    final resale = options.resaleValueBdt;
    if (!options.hasCopies && resale == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (options.hasCopies) SectionHeader(title: l10n.bookOtherWays),
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
                if (cheapest != null)
                  UsedOptionRow(
                    icon: Icons.people_outline_rounded,
                    title: l10n.bookFromReaders,
                    detail: l10n.bookListingCount(options.listings.length),
                    price: l10n.bookFromPrice(Bdt.format(cheapest.priceBdt)),
                    trailing: const Padding(
                      padding: EdgeInsets.all(Insets.md),
                      child: Icon(Icons.chevron_right_rounded),
                    ),
                    onTap: () => _pickListing(context, ref),
                  ),
                if (resale != null) ResaleNote(valueBdt: resale),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickListing(BuildContext context, WidgetRef ref) async {
    final copy = await showUsedListingsSheet(context, options.listings);
    if (copy != null && context.mounted) {
      await ref.addToCart(context, CartItemRef.listing(copy.id));
    }
  }
}
