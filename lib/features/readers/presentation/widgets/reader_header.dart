import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bites/presentation/widgets/bite_feed_parts.dart';
import '../../../orders/presentation/widgets/order_labels.dart';
import '../../domain/entities/reader_profile.dart';
import 'follow_button.dart';

/// Initial, name, area, member since, follower counts and Follow.
class ReaderHeader extends StatelessWidget {
  const ReaderHeader({super.key, required this.reader});

  final ReaderProfile reader;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final faint = AppFonts.ui(size: 12, color: palette.textFaint);
    final since = reader.memberSince;
    return SurfaceCard(
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        spacing: Insets.sm,
        children: [
          ReaderAvatar(readerId: reader.id, name: reader.name, radius: 32),
          Text(reader.name, style: context.texts.titleLarge),
          if (reader.showsDetails) ...[
            Text(
              [
                reader.area,
                reader.district,
              ].where((s) => s.isNotEmpty).join(', '),
              style: faint,
            ),
            if (since != null)
              Text(
                l10n.readerMemberSince(context.orderDate(since)),
                style: faint,
              ),
            Text(
              '${l10n.readerFollowers(reader.followers)} · '
              '${l10n.readerFollowingCount(reader.following)}',
              style: AppFonts.ui(
                size: 13,
                weight: FontWeight.w700,
                color: palette.text,
              ),
            ),
          ],
          if (!reader.isMe) FollowButton(reader: reader),
        ],
      ),
    );
  }
}
