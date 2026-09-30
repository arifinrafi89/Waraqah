import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// − 2 + in a pill. At one copy the minus becomes a bin, which removes the
/// line; the plus stops at [max].
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.max,
    required this.onChanged,
  });

  final int quantity;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final isLast = quantity <= 1;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Step(
            icon: isLast ? Icons.delete_outline_rounded : Icons.remove_rounded,
            tooltip: isLast ? l10n.cartRemove : l10n.cartDecrease,
            onPressed: () => onChanged(quantity - 1),
          ),
          SizedBox(
            width: 26,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppFonts.numeric(size: 13, color: palette.text),
            ),
          ),
          _Step(
            icon: Icons.add_rounded,
            tooltip: l10n.cartIncrease,
            onPressed: quantity < max ? () => onChanged(quantity + 1) : null,
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.icon, required this.tooltip, this.onPressed});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 18,
      color: palette.text,
      disabledColor: palette.textFaint,
      visualDensity: VisualDensity.compact,
    );
  }
}
