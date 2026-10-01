import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../inbox_routes.dart';
import '../providers/inbox_providers.dart';
import 'inbox_actions.dart';

/// Pinned under someone else's listing: Make an offer and Message while
/// it's on sale, or where the buyer's deal stands, with a way back into
/// the conversation.
class ListingOfferBar extends ConsumerWidget {
  const ListingOfferBar({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final mine = ref.watch(listingThreadsProvider(listing.id)).value;
    final thread = mine?.firstOrNull;
    final offer = thread?.pendingOffer;
    void openThread() => context.push(InboxRoutes.threadFor(thread!.id));
    final note = switch (listing) {
      _ when listing.isMyDeal && listing.isSold => l10n.chatBoughtIt,
      _ when listing.isMyDeal => l10n.chatReservedForYou,
      _ when listing.isSold => l10n.chatSoldElsewhere,
      _ when listing.isReserved => l10n.chatReservedElsewhere,
      _ when offer != null => l10n.usedOfferWaiting(
        Bdt.format(offer.amountBdt),
        listing.sellerName,
      ),
      _ => null,
    };
    final canOffer = listing.isAvailable && offer == null;
    final canTalk = thread != null || listing.isOpen;
    if (note == null && !canOffer && !canTalk) return const SizedBox.shrink();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(Insets.screen),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: Insets.sm,
            children: [
              if (note != null)
                Text(
                  note,
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              Row(
                spacing: Insets.md,
                children: [
                  if (canOffer)
                    Expanded(
                      child: PrimaryButton(
                        label: l10n.offerMake,
                        onPressed: () => ref.offerOn(context, listing),
                      ),
                    ),
                  if (canTalk)
                    Expanded(
                      child: SecondaryButton(
                        label: thread == null
                            ? l10n.usedMessage
                            : l10n.usedOpenChat,
                        onPressed: thread == null
                            ? () => ref.openChat(context, listing)
                            : openThread,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
