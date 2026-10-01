import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/moderation_rules.dart';
import '../../domain/entities/queued_listing.dart';
import 'moderation_labels.dart';

/// Asks why a Listing needs changes or is rejected. Answers the reason the
/// seller will see, or `null` when dismissed.
Future<String?> showDecisionReasonSheet(
  BuildContext context,
  ListingDecision decision,
) => showModalBottomSheet<String>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (_) => _ReasonSheet(decision),
);

class _ReasonSheet extends StatefulWidget {
  const _ReasonSheet(this.decision);

  final ListingDecision decision;

  @override
  State<_ReasonSheet> createState() => _ReasonSheetState();
}

class _ReasonSheetState extends State<_ReasonSheet> {
  final _reason = TextEditingController();

  @override
  void dispose() {
    _reason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final problem = ModerationRules.checkDecision(
      widget.decision,
      _reason.text,
    );
    final tooLong = problem == ModerationProblem.reasonTooLong;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.lg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(
            l10n.decisionTitle(widget.decision),
            style: context.texts.titleMedium,
          ),
          Wrap(
            spacing: Insets.sm,
            runSpacing: Insets.sm,
            children: [
              for (final quick in l10n.quickReasons(widget.decision))
                ActionChip(
                  label: Text(quick),
                  onPressed: () => setState(() => _reason.text = quick),
                ),
            ],
          ),
          AppTextField(
            label: l10n.moderationReasonLabel,
            hint: l10n.moderationReasonHint,
            icon: Icons.edit_note_rounded,
            controller: _reason,
            onChanged: (_) => setState(() {}),
          ),
          if (tooLong)
            Text(
              l10n.moderationReasonTooLong(ModerationRules.maxReason),
              style: AppFonts.ui(size: 11.5, color: palette.danger),
            ),
          PrimaryButton(
            label: l10n.moderationSend,
            onPressed: problem == null
                ? () => Navigator.pop(context, _reason.text.trim())
                : null,
          ),
        ],
      ),
    );
  }
}
