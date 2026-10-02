import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bites/presentation/providers/bite_providers.dart';
import '../../../bites/presentation/widgets/bite_card.dart';

class BookBitesSection extends ConsumerWidget {
  const BookBitesSection({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.bookBitesTitle),
        AsyncView(
          value: ref.watch(bitesAboutBookProvider(bookId)),
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(bitesAboutBookProvider(bookId)),
          skeleton: const ShimmerBox(height: 120, radius: Radii.card),
          builder: (bites) => bites.isEmpty
              ? Text(l10n.bookBitesEmpty, style: context.texts.bodySmall)
              : Column(
                  spacing: Insets.sm,
                  children: [
                    for (final bite in bites)
                      BiteCard(key: ValueKey(bite.id), bite: bite),
                  ],
                ),
        ),
      ],
    );
  }
}
