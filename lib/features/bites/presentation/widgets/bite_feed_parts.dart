import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/bite.dart';

class BiteAvatar extends StatelessWidget {
  const BiteAvatar({super.key, required this.bite, required this.palette});
  final Bite bite;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: 20,
    backgroundColor: palette.chipFor(bite.avatarSeed),
    foregroundImage: bite.avatarUrl == null
        ? null
        : NetworkImage(bite.avatarUrl!),
    child: Text(
      bite.initial,
      style: AppFonts.ui(
        size: 13,
        weight: FontWeight.w800,
        color: palette.accentInk,
      ),
    ),
  );
}

class BiteAuthorLine extends StatelessWidget {
  const BiteAuthorLine({super.key, required this.bite, required this.palette});
  final Bite bite;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        bite.authorName,
        style: AppFonts.ui(
          size: 14,
          weight: FontWeight.w800,
          color: palette.text,
        ),
      ),
      Text(
        '@${bite.authorHandle}',
        style: AppFonts.ui(size: 11, color: palette.textFaint),
      ),
    ],
  );
}

class BiteAction extends StatelessWidget {
  const BiteAction({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    this.active = false,
    this.onTap,
  });
  final IconData icon;
  final int count;
  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Semantics(
      label: label,
      button: onTap != null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: active
                  ? context.palette.accent
                  : context.palette.textFaint,
            ),
            const SizedBox(width: 5),
            Text(
              '$count',
              style: AppFonts.ui(
                size: 11,
                color: active
                    ? context.palette.accent
                    : context.palette.textFaint,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
