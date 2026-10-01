import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../sell_back/presentation/providers/sell_back_providers.dart';
import 'finished_it_choices.dart';

/// "Finished Sapiens?": list it for readers with the form filled in, sell
/// it back to Waraqah, or keep it.
Future<void> showFinishedItSheet(BuildContext context, String bookId) =>
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => _FinishedItSheet(bookId),
    );

class _FinishedItSheet extends ConsumerWidget {
  const _FinishedItSheet(this.bookId);

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      child: AsyncView(
        value: ref.watch(sellBackBookProvider(bookId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(sellBackBookProvider(bookId)),
        skeleton: const Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.md,
          children: [
            ShimmerBox(height: 20),
            ShimmerBox(height: 48),
            ShimmerBox(height: 48),
          ],
        ),
        builder: (book) => book == null
            ? Text(l10n.usedBuyUnavailable)
            : FinishedItChoices(book: book),
      ),
    );
  }
}
