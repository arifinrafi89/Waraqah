import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_message.dart';
import 'inbox_labels.dart';

/// "How do you want the book?" Meetup or courier, with what the seller
/// prefers underneath.
class OfferHandoverPicker extends StatelessWidget {
  const OfferHandoverPicker({
    super.key,
    required this.value,
    required this.note,
    required this.onChanged,
  });

  final OfferHandover value;
  final String note;
  final ValueChanged<OfferHandover> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        Text(
          l10n.offerHandover,
          style: AppFonts.ui(
            size: 11.5,
            weight: FontWeight.w700,
            color: palette.textDim,
          ),
        ),
        Wrap(
          spacing: Insets.sm,
          children: [
            for (final handover in OfferHandover.values)
              ChoiceChip(
                label: Text(l10n.handoverName(handover)),
                selected: value == handover,
                onSelected: (_) => onChanged(handover),
              ),
          ],
        ),
        Text(note, style: AppFonts.ui(size: 11.5, color: palette.textFaint)),
      ],
    );
  }
}
