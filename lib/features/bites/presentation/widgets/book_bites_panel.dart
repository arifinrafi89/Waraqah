import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite_query.dart';
import '../providers/bite_providers.dart';
import 'bite_actions.dart';
import 'bite_feed_card.dart';
import 'bite_feed_skeleton.dart';

/// The book page's "Bites about this book": the 3 newest Bites tagged with
/// it, "See all", and a button that opens the composer pre-tagged.
class BookBitesPanel extends ConsumerWidget {
  const BookBitesPanel({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final query = BiteQuery(bookId: bookId);
    final value = ref.watch(bitesProvider(query));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: l10n.bitesAboutBook,
          actionLabel: (value.value?.isNotEmpty ?? false)
              ? l10n.bitesSeeAll
              : null,
          onAction: () => context.push(BitesRoutes.forBook(bookId)),
        ),
        AsyncView(
          value: value,
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(bitesProvider(query)),
          skeleton: const BiteFeedSkeleton(),
          builder: (bites) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (bites.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.sm),
                  child: Text(
                    l10n.bitesNoneAboutBook,
                    style: context.texts.bodySmall,
                  ),
                ),
              for (final bite in bites.take(3)) BiteFeedCard(bite: bite),
              OutlinedButton.icon(
                icon: const Icon(Icons.edit_rounded),
                label: Text(l10n.bitesPostAboutBook),
                onPressed: () => ref.composeBite(context, bookId: bookId),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
