import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_palette.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import '../utils/cover_gradient.dart';

/// Placeholder book cover: a seeded gradient, a bottom scrim and the title.
///
/// Real Cloudinary artwork drops in here later without touching any caller —
/// that is the point of keeping cover art as its own brick.
class CoverArt extends StatelessWidget {
  const CoverArt({
    super.key,
    required this.title,
    required this.seed,
    this.aspectRatio = 3 / 4,
    this.fontSize = 13,
    this.radius,
    this.badge,
    this.cornerTag,
    this.centerTitle = false,
  });

  final String title;
  final int seed;
  final double aspectRatio;
  final double fontSize;
  final double? radius;
  final Widget? badge;
  final Widget? cornerTag;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: CoverGradient.of(palette.chipFor(seed)),
          borderRadius: radius == null ? null : BorderRadius.circular(radius!),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (!centerTitle) _scrim(palette),
            Padding(
              padding: const EdgeInsets.all(Insets.sm + 2),
              child: Align(
                alignment: centerTitle
                    ? Alignment.center
                    : Alignment.bottomLeft,
                child: Text(
                  title,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: centerTitle
                      ? AppFonts.display(size: fontSize, color: Colors.white)
                      : AppFonts.ui(
                          size: fontSize,
                          weight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.25,
                        ),
                ),
              ),
            ),
            if (badge != null)
              Positioned(top: Insets.sm, left: Insets.sm, child: badge!),
            if (cornerTag != null)
              Positioned(top: 7, right: 7, child: cornerTag!),
          ],
        ),
      ),
    );
  }

  Widget _scrim(AppPalette palette) => DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [palette.scrim, Colors.transparent],
        stops: const [0, 0.6],
      ),
      borderRadius: radius == null ? null : BorderRadius.circular(radius!),
    ),
  );
}
