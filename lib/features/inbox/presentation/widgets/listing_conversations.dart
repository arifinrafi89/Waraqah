import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/inbox_providers.dart';
import 'inbox_skeleton.dart';
import 'thread_tile.dart';

/// On the seller's own listing: every buyer's conversation about it, with
/// their latest offer or message. Decisions happen inside each one.
class ListingConversations extends ConsumerWidget {
  const ListingConversations({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.usedOffersAndMessages),
        AsyncView(
          value: ref.watch(listingThreadsProvider(listingId)),
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(listingThreadsProvider(listingId)),
          skeleton: const InboxSkeleton(rows: 2),
          builder: (threads) => threads.isEmpty
              ? Text(
                  l10n.usedNoOffersYet,
                  style: AppFonts.ui(
                    size: 12.5,
                    color: context.palette.textDim,
                  ),
                )
              : Column(
                  spacing: Insets.sm,
                  children: [
                    for (final thread in threads) ThreadTile(thread: thread),
                  ],
                ),
        ),
      ],
    );
  }
}
