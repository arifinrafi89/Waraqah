import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/queued_listing.dart';
import 'moderation_actions.dart';

/// Approve, ask for changes, or reject.
class ListingDecisionBar extends ConsumerWidget {
  const ListingDecisionBar({super.key, required this.listing});

  final QueuedListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    void decide(ListingDecision decision) =>
        ref.decideListing(context, listing, decision);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        PrimaryButton(
          label: l10n.moderationApprove,
          icon: Icons.check_rounded,
          onPressed: () => decide(ListingDecision.approve),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => decide(ListingDecision.requestChanges),
                child: Text(l10n.moderationRequestChanges),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => decide(ListingDecision.reject),
                style: TextButton.styleFrom(
                  foregroundColor: context.palette.danger,
                ),
                child: Text(l10n.moderationReject),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
