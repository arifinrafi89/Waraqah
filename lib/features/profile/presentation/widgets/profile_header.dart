import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import 'profile_avatar.dart';
import 'profile_stat.dart';

/// Avatar, name and contact line (email or phone), plus the activity
/// counters.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.contact,
    required this.stats,
    this.photo,
    this.onEdit,
  });

  final String name;
  final String contact;
  final Uint8List? photo;

  /// Label to value, in display order.
  final Map<String, String> stats;
  final VoidCallback? onEdit;

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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ProfileAvatar(name: name, photo: photo),
                  if (onEdit != null)
                    Positioned(
                      right: -4,
                      bottom: -4,
                      child: IconButton(
                        onPressed: onEdit,
                        tooltip: AppL10n.of(context)!.profileEditProfile,
                        icon: const Icon(Icons.edit_rounded),
                        iconSize: 13,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 24,
                          height: 24,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: palette.surface,
                          foregroundColor: palette.accent,
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: context.texts.titleLarge),
                    Text(
                      contact,
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
                Expanded(
                  child: ProfileStat(label: entry.key, value: entry.value),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
