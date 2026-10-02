import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/press_scale.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/bite.dart';
import 'bite_body.dart';

/// A single Book-Bite in Home's strip: avatar, author line, the post
/// (blurred when a spoiler) and the book tag that opens the book page.
class BiteCard extends StatelessWidget {
  const BiteCard({super.key, required this.bite});

  final Bite bite;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return PressScale(
      child: SurfaceCard(
        padding: const EdgeInsets.all(Insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: Insets.sm,
              children: [
                Container(
                  width: Sizes.avatar,
                  height: Sizes.avatar,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: palette.chipFor(bite.authorId.hashCode),
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
                        bite.isMine
                            ? AppL10n.of(context)!.bitesYou
                            : bite.authorName,
                        style: AppFonts.ui(
                          size: 12,
                          weight: FontWeight.w800,
                          color: palette.text,
                        ),
                      ),
                      Text(
                        bite.authorArea,
                        style: AppFonts.ui(
                          size: 10.5,
                          color: palette.textFaint,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Insets.sm),
            BiteBody(bite: bite, size: 12, maxLines: 3),
            if (bite.hasBookTag)
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: InkWell(
                  onTap: () =>
                      context.push(CatalogRoutes.bookDetailFor(bite.bookId!)),
                  borderRadius: BorderRadius.circular(Radii.sm),
                  child: AccentTag(label: bite.bookTitle!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
