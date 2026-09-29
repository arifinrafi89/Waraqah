import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

/// Small "i" badge after the Non-Beneficial chip, explaining the curation
/// note on hover (desktop) or tap (phone).
class BenefitInfoIcon extends StatelessWidget {
  const BenefitInfoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return Semantics(
      label: l10n.homeNonBeneficialNote,
      child: Tooltip(
        message: l10n.homeNonBeneficialNote,
        triggerMode: TooltipTriggerMode.tap,
        showDuration: const Duration(seconds: 6),
        textStyle: const TextStyle(color: Colors.white, fontSize: 13),
        constraints: const BoxConstraints(maxWidth: 260),
        child: CircleAvatar(
          radius: 9,
          backgroundColor: palette.danger,
          child: const Icon(Icons.info_rounded, size: 12, color: Colors.white),
        ),
      ),
    );
  }
}
