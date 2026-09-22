import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Horizontally scrolling pill selector. The active pill fills with the accent
/// colour and grows a leading dot, matching the design board.
class FilterChipBar extends StatelessWidget {
  const FilterChipBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    this.padding = const EdgeInsets.symmetric(horizontal: Insets.screen),
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        spacing: Insets.sm,
        children: [
          for (var i = 0; i < labels.length; i++)
            _Chip(
              label: labels[i],
              isActive: i == selectedIndex,
              onTap: () => onSelected(i),
            ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.isActive, required this.onTap});

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final fg = isActive ? palette.accentInk : palette.textDim;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Radii.pill),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? palette.accent : palette.surface,
          border: Border.all(color: isActive ? palette.accent : palette.border),
          borderRadius: BorderRadius.circular(Radii.pill),
        ),
        child: Row(
          spacing: 6,
          children: [
            if (isActive)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
              ),
            Text(
              label,
              style: AppFonts.ui(size: 12.5, weight: FontWeight.w700, color: fg),
            ),
          ],
        ),
      ),
    );
  }
}
