import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// "312 results" on the left, sort and filter pills on the right.
class CatalogResultBar extends StatelessWidget {
  const CatalogResultBar({
    super.key,
    required this.resultLabel,
    required this.sortLabel,
    required this.filterLabel,
  });

  final String resultLabel;
  final String sortLabel;
  final String filterLabel;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.screen, 14, Insets.screen, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              resultLabel,
              style: AppFonts.ui(
                size: 11.5,
                weight: FontWeight.w700,
                color: palette.textFaint,
              ),
            ),
          ),
          _Pill(label: sortLabel, icon: Icons.sort_rounded),
          const SizedBox(width: 7),
          _Pill(label: filterLabel, icon: Icons.tune_rounded),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(icon, size: 13, color: palette.text),
          Text(
            label,
            style: AppFonts.ui(
              size: 11,
              weight: FontWeight.w800,
              color: palette.text,
            ),
          ),
        ],
      ),
    );
  }
}
