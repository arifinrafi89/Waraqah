import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite_query.dart';
import '../providers/bite_providers.dart';
import '../widgets/bite_actions.dart';
import '../widgets/bite_feed_card.dart';
import '../widgets/bite_feed_skeleton.dart';
import '../widgets/bites_message.dart';

/// `/bites/book?id=`: every Bite about one Book, newest first.
class BookBitesPage extends ConsumerWidget {
  const BookBitesPage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final query = BiteQuery(bookId: bookId);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.bitesAboutBook)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.bitesPostAboutBook,
        onPressed: () => ref.composeBite(context, bookId: bookId),
        child: const Icon(Icons.edit_rounded),
      ),
      body: AsyncView(
        value: ref.watch(bitesProvider(query)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(bitesProvider(query)),
        skeleton: const Padding(
          padding: EdgeInsets.all(Insets.screen),
          child: BiteFeedSkeleton(),
        ),
        builder: (bites) => bites.isEmpty
            ? BitesMessage(text: l10n.bitesNoneAboutBook)
            : ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [for (final b in bites) BiteFeedCard(bite: b)],
              ),
      ),
    );
  }
}
