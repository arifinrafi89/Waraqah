import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sell_back.dart';
import '../providers/sell_back_providers.dart';
import 'sell_back_book_row.dart';

/// Finding the book in the catalog by title or author.
class SellBackBookSearch extends ConsumerWidget {
  const SellBackBookSearch({
    super.key,
    required this.query,
    required this.onQuery,
    required this.onPick,
  });

  final String query;
  final ValueChanged<String> onQuery;
  final ValueChanged<SellBackBook> onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        AppTextField(
          label: l10n.sellBackFindLabel,
          hint: l10n.sellBackFindHint,
          icon: Icons.search_rounded,
          onChanged: onQuery,
        ),
        if (query.trim().length >= 2)
          AsyncView(
            value: ref.watch(sellBackBooksProvider(query.trim())),
            errorLabel: l10n.commonSomethingWentWrong,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(sellBackBooksProvider(query.trim())),
            skeleton: const Column(
              spacing: Insets.sm,
              children: [ShimmerBox(height: 48), ShimmerBox(height: 48)],
            ),
            builder: (books) => books.isEmpty
                ? Text(l10n.sellBackNoBooks, style: context.texts.bodySmall)
                : Column(
                    spacing: Insets.sm,
                    children: [
                      for (final book in books)
                        InkWell(
                          onTap: () => onPick(book),
                          borderRadius: BorderRadius.circular(Radii.md),
                          child: SellBackBookRow(book: book),
                        ),
                    ],
                  ),
          ),
      ],
    );
  }
}
