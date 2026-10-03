import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/listing_rules.dart';
import 'p2p_labels.dart';

/// Under each add-listing step: what still needs fixing, then Next and
/// Back, or on the last step Send for review and Save draft.
class ListingFormControls extends StatelessWidget {
  const ListingFormControls({
    super.key,
    required this.last,
    required this.busy,
    required this.problem,
    required this.onNext,
    required this.onBack,
    required this.onDraft,
    required this.onSend,
  });

  final bool last;
  final bool busy;
  final ListingProblem? problem;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final VoidCallback onDraft;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final back = onBack == null
        ? null
        : TextButton(onPressed: onBack, child: Text(l10n.listingBack));
    return Padding(
      padding: const EdgeInsets.only(top: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          if (problem case final problem?)
            Text(
              l10n.listingProblem(problem),
              style: AppFonts.ui(size: 13, color: context.palette.danger),
            ),
          if (last) ...[
            PrimaryButton(
              label: l10n.listingSendForReview,
              isBusy: busy,
              onPressed: onSend,
            ),
            SecondaryButton(
              label: l10n.listingSaveDraft,
              onPressed: busy ? null : onDraft,
            ),
            ?back,
          ] else
            Row(
              spacing: Insets.sm,
              children: [
                FilledButton(onPressed: onNext, child: Text(l10n.listingNext)),
                ?back,
              ],
            ),
        ],
      ),
    );
  }
}
