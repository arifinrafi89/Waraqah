import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import 'inbox_labels.dart';
import 'offer_decision.dart';

/// An offer in the conversation: price, meetup or courier, and where it
/// stands. While it waits, the seller can accept (reserving the book) or
/// decline; the buyer sees that it's waiting.
class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.thread,
    required this.message,
    required this.offer,
  });

  final InboxThread thread;
  final InboxMessage message;
  final Offer offer;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final waiting = offer.status == OfferStatus.pending;
    final onSale = thread.listing.status == P2pListingStatus.live;
    final faint = AppFonts.ui(size: 11.5, color: palette.textDim);
    return Align(
      alignment: message.from == MessageFrom.me
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.78,
        child: SurfaceCard(
          padding: const EdgeInsets.all(Insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    size: 18,
                    color: palette.accent,
                  ),
                  const SizedBox(width: Insets.sm),
                  Expanded(
                    child: Text(
                      l10n.offerCardTitle(Bdt.format(offer.amountBdt)),
                      style: context.texts.titleSmall,
                    ),
                  ),
                  Text(
                    waiting && thread.isBuying
                        ? l10n.offerWaitingFor(thread.otherName)
                        : l10n.offerStatusName(offer.status),
                    style: AppFonts.ui(
                      size: 11,
                      weight: FontWeight.w800,
                      color: waiting ? palette.accent : palette.textFaint,
                    ),
                  ),
                ],
              ),
              Text(
                '${l10n.handoverName(offer.handover)} · '
                '${messageTime(context, message.at)}',
                style: faint,
              ),
              if (waiting && !thread.isBuying && onSale)
                OfferDecision(thread: thread, offer: offer),
              if (waiting && !thread.isBuying && !onSale)
                Text(l10n.offerReservedHint, style: faint),
            ],
          ),
        ),
      ),
    );
  }
}
