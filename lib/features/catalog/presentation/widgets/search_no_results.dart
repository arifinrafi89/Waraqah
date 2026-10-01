import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../book_request/book_request_routes.dart';
import '../providers/search_providers.dart';

/// The no-results message for `query`, a "Did you mean…?" link when a title
/// is close (tapping it calls [onPick]), and a Request this book button.
class SearchNoResults extends ConsumerWidget {
  const SearchNoResults({super.key, required this.query, required this.onPick});

  final String query;
  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final guess = ref.watch(didYouMeanProvider).value;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.md,
          children: [
            Text(
              l10n.searchNoResults(query),
              textAlign: TextAlign.center,
              style: context.texts.bodyMedium,
            ),
            if (guess != null)
              TextButton(
                onPressed: () => onPick(guess),
                child: Text(
                  l10n.searchDidYouMean(guess),
                  textAlign: TextAlign.center,
                ),
              ),
            PrimaryButton(
              label: l10n.searchRequestBook,
              onPressed: () =>
                  context.push(BookRequestRoutes.newFor(title: query)),
            ),
          ],
        ),
      ),
    );
  }
}
