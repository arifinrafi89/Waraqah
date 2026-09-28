import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';

/// Avatar, name and campus line, plus the three activity counters.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.campus,
    required this.stats,
  });

  final String name;
  final String campus;

  /// Label to value, in display order.
  final Map<String, String> stats;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      radius: Radii.hero,
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        children: [
          Row(
            spacing: Insets.md,
            children: [
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.accent,
                  borderRadius: BorderRadius.circular(Radii.card),
                ),
                child: Text(
                  name.isEmpty ? '?' : name[0],
                  style: AppFonts.display(size: 24, color: palette.accentInk),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: context.texts.titleLarge),
                    Text(
                      campus,
                      style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.lg),
          Row(
            children: [
              for (final entry in stats.entries)
                Expanded(child: _Stat(label: entry.key, value: entry.value)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      children: [
        Text(value, style: AppFonts.numeric(size: 18, color: palette.text)),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 10, color: palette.textFaint),
        ),
      ],
    );
  }
}
