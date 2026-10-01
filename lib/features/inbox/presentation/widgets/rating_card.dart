import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/presentation/widgets/rating_stars.dart';
import '../../domain/entities/inbox_thread.dart';
import 'rating_form.dart';

/// After the sale: the reader rates the other person (once), and sees how
/// they were rated back. Ratings show on each person's seller page.
class RatingCard extends ConsumerWidget {
  const RatingCard({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!thread.isSoldHere) return const SizedBox.shrink();
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final name = thread.otherName;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          if (thread.myRating case final stars?)
            _Line(label: l10n.chatYouRated(name), stars: stars)
          else
            RatingForm(thread: thread),
          if (thread.theirRating case final stars?)
            _Line(label: l10n.chatTheyRated(name), stars: stars)
          else
            Text(l10n.chatNotRatedYet(name), style: dim),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.label, required this.stars});

  final String label;
  final int stars;

  @override
  Widget build(BuildContext context) => Row(
    spacing: Insets.sm,
    children: [
      Expanded(child: Text(label, style: context.texts.titleSmall)),
      RatingStars(stars: stars.toDouble()),
    ],
  );
}
