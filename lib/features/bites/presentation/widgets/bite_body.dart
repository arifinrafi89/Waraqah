import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import '../providers/bite_tag_providers.dart';

/// A Bite's text. Someone else's spoiler stays blurred until tapped, then
/// stays open for the session.
class BiteBody extends ConsumerWidget {
  const BiteBody({
    super.key,
    required this.bite,
    this.size = 15,
    this.maxLines,
  });

  final Bite bite;
  final double size;
  final int? maxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final text = Text(
      bite.text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: AppFonts.ui(size: size, height: 1.5, color: palette.textDim),
    );
    final hidden =
        bite.spoiler &&
        !bite.isMine &&
        !ref.watch(revealedSpoilersProvider).contains(bite.id);
    if (!hidden) return text;
    return GestureDetector(
      onTap: () => ref.read(revealedSpoilersProvider.notifier).reveal(bite.id),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ExcludeSemantics(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: text,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.md,
              vertical: Insets.sm,
            ),
            decoration: BoxDecoration(
              color: palette.surface2,
              borderRadius: BorderRadius.circular(Radii.pill),
            ),
            child: Text(
              AppL10n.of(context)!.bitesSpoilerAbout(bite.bookTitle ?? ''),
              textAlign: TextAlign.center,
              style: AppFonts.ui(
                size: 12,
                weight: FontWeight.w700,
                color: palette.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
