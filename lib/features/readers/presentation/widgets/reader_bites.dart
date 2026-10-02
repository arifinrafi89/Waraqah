import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bites/domain/entities/bite_query.dart';
import '../../../bites/presentation/providers/bite_providers.dart';
import '../../../bites/presentation/widgets/bite_feed_card.dart';
import '../../../bites/presentation/widgets/bite_feed_skeleton.dart';

/// A Reader's Bites, newest first.
class ReaderBites extends ConsumerWidget {
  const ReaderBites({super.key, required this.readerId});

  final String readerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final query = BiteQuery(authorId: readerId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.readerBites),
        AsyncView(
          value: ref.watch(bitesProvider(query)),
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(bitesProvider(query)),
          skeleton: const BiteFeedSkeleton(),
          builder: (bites) => bites.isEmpty
              ? Text(l10n.readerNoBites, style: context.texts.bodySmall)
              : Column(
                  children: [for (final b in bites) BiteFeedCard(bite: b)],
                ),
        ),
      ],
    );
  }
}
