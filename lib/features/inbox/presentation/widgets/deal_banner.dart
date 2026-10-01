import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_thread.dart';
import 'deal_actions.dart';

/// Where the deal stands, under the pinned book. When the book is reserved
/// for this buyer, the seller can mark it sold after the handover or make
/// it available again if the deal falls through. Nothing shows while the
/// book is simply on sale.
class DealBanner extends ConsumerWidget {
  const DealBanner({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final name = thread.otherName;
    final (String?, String?) state = switch (thread) {
      _ when thread.isReservedHere && thread.isBuying => (
        l10n.chatReservedForYou,
        l10n.chatPayOnHandover,
      ),
      _ when thread.isReservedHere => (
        l10n.chatReservedFor(name),
        l10n.chatSellerNext(name),
      ),
      _ when thread.isSoldHere && thread.isBuying => (l10n.chatBoughtIt, null),
      _ when thread.isSoldHere => (l10n.chatSoldTo(name), null),
      _ when thread.isTakenElsewhere => (
        thread.listing.status == P2pListingStatus.sold
            ? l10n.chatSoldElsewhere
            : l10n.chatReservedElsewhere,
        null,
      ),
      _ => (null, null),
    };
    final (title, note) = state;
    if (title == null) return const SizedBox.shrink();
    final palette = context.palette;
    final sellerControls = thread.isReservedHere && !thread.isBuying;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.md),
      decoration: BoxDecoration(
        color: palette.accentSoft,
        borderRadius: BorderRadius.circular(Radii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(title, style: context.texts.titleSmall),
          if (note != null)
            Text(note, style: AppFonts.ui(size: 11.5, color: palette.textDim)),
          if (sellerControls)
            Padding(
              padding: const EdgeInsets.only(top: Insets.sm),
              child: Row(
                spacing: Insets.sm,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: l10n.chatMarkSold,
                      onPressed: () => ref.confirmMarkSold(context, thread),
                    ),
                  ),
                  Expanded(
                    child: SecondaryButton(
                      label: l10n.chatMakeAvailable,
                      onPressed: () => ref.confirmRelease(context, thread),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
