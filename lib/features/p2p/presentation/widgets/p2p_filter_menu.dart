import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// A filter pill that opens a menu: "any" first, then [options] (value to
/// label). Shows the chosen option's label, or [label] when nothing is
/// chosen.
class P2pFilterMenu<T> extends StatelessWidget {
  const P2pFilterMenu({
    super.key,
    required this.label,
    required this.anyLabel,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final String anyLabel;
  final T? value;
  final Map<T, String> options;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final chosen = value == null ? null : options[value];
    final isActive = chosen != null;
    final fg = isActive ? palette.accentInk : palette.textDim;
    // A menu item's value can't be null (that's "closed"), so each option
    // is wrapped in a record.
    return PopupMenuButton<(T?,)>(
      initialValue: (value,),
      onSelected: (picked) => onChanged(picked.$1),
      itemBuilder: (_) => [
        PopupMenuItem(value: (null,), child: Text(anyLabel)),
        for (final MapEntry(:key, value: text) in options.entries)
          PopupMenuItem(value: (key,), child: Text(text)),
      ],
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radii.card),
      ),
      color: palette.surface,
      tooltip: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? palette.accent : palette.surface,
          border: Border.all(color: isActive ? palette.accent : palette.border),
          borderRadius: BorderRadius.circular(Radii.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            Text(
              chosen ?? label,
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w700,
                color: fg,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: fg),
          ],
        ),
      ),
    );
  }
}
