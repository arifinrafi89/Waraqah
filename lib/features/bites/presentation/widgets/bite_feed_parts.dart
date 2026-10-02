import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// A reader's initial in a circle, coloured by their id.
class ReaderAvatar extends StatelessWidget {
  const ReaderAvatar({
    super.key,
    required this.readerId,
    required this.name,
    this.radius = 20,
  });

  final String readerId;
  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return CircleAvatar(
      radius: radius,
      backgroundColor: palette.chipFor(readerId.hashCode),
      child: Text(
        name.isEmpty ? '?' : name[0].toUpperCase(),
        style: AppFonts.ui(
          size: radius * 0.65,
          weight: FontWeight.w800,
          color: palette.accentInk,
        ),
      ),
    );
  }
}

/// An icon with an optional count: like, comments, share.
class BiteAction extends StatelessWidget {
  const BiteAction({
    super.key,
    required this.icon,
    required this.label,
    this.count,
    this.active = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final int? count;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? context.palette.accent : context.palette.textFaint;
    return Expanded(
      child: Semantics(
        label: label,
        button: onTap != null,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Radii.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Insets.md),
            child: Row(
              children: [
                Icon(icon, size: 18, color: color),
                if (count != null) ...[
                  const SizedBox(width: 5),
                  Text('$count', style: AppFonts.ui(size: 11, color: color)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
