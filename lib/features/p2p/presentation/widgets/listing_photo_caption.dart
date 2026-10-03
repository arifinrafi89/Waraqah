import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// A photo tile's small caption: what it shows, or whether it's needed.
class ListingPhotoCaption extends StatelessWidget {
  const ListingPhotoCaption(this.text, {super.key, this.faint = false});

  final String text;
  final bool faint;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    // A light backing keeps it readable over a photo.
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.ui(
            size: 10.5,
            weight: faint ? FontWeight.w500 : FontWeight.w700,
            color: faint ? palette.textDim : palette.text,
          ),
        ),
      ),
    );
  }
}
