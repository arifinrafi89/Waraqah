import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../domain/entities/bite.dart';

/// A single Book-Bite: avatar, author line, the post, and the inline book tag
/// that deep-links to the tagged title's purchase page.
class BiteCard extends StatelessWidget {
  const BiteCard({super.key, required this.bite, this.onTagTap});

  final Bite bite;
  final VoidCallback? onTagTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      width: Sizes.biteCardWidth,
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              Container(
                width: Sizes.avatar,
                height: Sizes.avatar,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.chipFor(bite.avatarSeed),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  bite.initial,
                  style: AppFonts.ui(
                    size: 12,
                    weight: FontWeight.w800,
                    color: palette.accentInk,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bite.authorName,
                      style: AppFonts.ui(
                        size: 12,
                        weight: FontWeight.w800,
                        color: palette.text,
                      ),
                    ),
                    Text(
                      bite.authorHandle,
                      style: AppFonts.ui(size: 10.5, color: palette.textFaint),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.sm),
          Text(
            bite.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.ui(size: 12, height: 1.45, color: palette.textDim),
          ),
          if (bite.hasBookTag)
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: InkWell(
                onTap: onTagTap,
                borderRadius: BorderRadius.circular(Radii.sm),
                child: AccentTag(label: bite.taggedBookTitle!),
              ),
            ),
        ],
      ),
    );
  }
}
