import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// The Reader's photo, or the first letter of their name on the accent
/// colour.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    this.photo,
    this.size = 54,
  });

  final String name;
  final Uint8List? photo;
  final double size;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: palette.accent,
        borderRadius: BorderRadius.circular(Radii.card),
        image: photo == null
            ? null
            : DecorationImage(image: MemoryImage(photo!), fit: BoxFit.cover),
      ),
      child: photo != null
          ? null
          : Text(
              name.isEmpty ? '?' : name.characters.first.toUpperCase(),
              style: AppFonts.display(
                size: size * 0.44,
                color: palette.accentInk,
              ),
            ),
    );
  }
}
