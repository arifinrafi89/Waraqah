import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/book_extras_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/series_entry_row.dart';

/// `/catalog/series/:id`: every book in the Series in reading order.
class SeriesPage extends ConsumerWidget {
  const SeriesPage({super.key, required this.seriesId});

  final String seriesId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: ref.watch(seriesByIdProvider(seriesId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(seriesByIdProvider(seriesId)),
        skeleton: const Column(
          children: [
            BackAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
            ),
          ],
        ),
        builder: (series) => Column(
          children: [
            BackAppBar(title: series?.name),
            Expanded(
              child: series == null
                  ? NotFoundView(
                      label: l10n.commonNotFound,
                      backLabel: l10n.commonBack,
                      onBack: BackAppBar.goBack(context),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        Insets.screen,
                        0,
                        Insets.screen,
                        Insets.xl,
                      ),
                      itemCount: series.entries.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (_, i) =>
                          SeriesEntryRow(entry: series.entries[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
