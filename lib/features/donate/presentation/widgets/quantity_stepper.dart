import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// "How many copies?" with − and + between 1 and [max].
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.label,
    required this.value,
    required this.max,
    required this.onChanged,
  });

  final String label;
  final int value;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppFonts.ui(size: 12, color: palette.textDim),
          ),
        ),
        IconButton.outlined(
          tooltip: l10n.giftDonateFewer,
          icon: const Icon(Icons.remove_rounded),
          onPressed: value > 1 ? () => onChanged(value - 1) : null,
        ),
        SizedBox(
          width: 40,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: AppFonts.numeric(size: 16, color: palette.text),
          ),
        ),
        IconButton.outlined(
          tooltip: l10n.giftDonateMore,
          icon: const Icon(Icons.add_rounded),
          onPressed: value < max ? () => onChanged(value + 1) : null,
        ),
      ],
    );
  }
}
