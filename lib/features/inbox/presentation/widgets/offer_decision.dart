import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import 'deal_actions.dart';

/// The seller's Accept and Decline under a waiting offer.
class OfferDecision extends ConsumerWidget {
  const OfferDecision({super.key, required this.thread, required this.offer});

  final InboxThread thread;
  final Offer offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: Insets.sm),
      child: Row(
        spacing: Insets.sm,
        children: [
          Expanded(
            child: PrimaryButton(
              label: l10n.offerAccept,
              onPressed: () =>
                  ref.decideOffer(context, thread, offer, accept: true),
            ),
          ),
          Expanded(
            child: SecondaryButton(
              label: l10n.offerDecline,
              onPressed: () =>
                  ref.decideOffer(context, thread, offer, accept: false),
            ),
          ),
        ],
      ),
    );
  }
}
