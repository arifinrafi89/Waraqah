import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/book_series.dart';
import '../providers/book_extras_providers.dart';
import 'series_tile.dart';

/// "Harry Potter · Book 1 of 7": every book in the series, in reading order,
/// with this one marked. Books Waraqah doesn't sell yet are still listed.
class SeriesPanel extends ConsumerWidget {
  const SeriesPanel({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(seriesProvider(bookId)),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(seriesProvider(bookId)),
      skeleton: const ShimmerBox(height: 160, radius: Radii.card),
      builder: (series) =>
          series == null ? const SizedBox.shrink() : _Series(series, bookId),
    );
  }
}

class _Series extends StatelessWidget {
  const _Series(this.series, this.bookId);

  final BookSeries series;
  final String bookId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final position = series.positionOf(bookId) ?? 1;
    void open() => context.push(CatalogRoutes.seriesFor(series.id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: open,
          child: SectionHeader(
            title: series.name,
            subtitle: l10n.bookSeriesPosition(position, series.entries.length),
            actionLabel: l10n.seriesOpen,
            onAction: open,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              for (final entry in series.entries)
                SeriesTile(
                  key: ValueKey(entry.position),
                  entry: entry,
                  isCurrent: entry.bookId == bookId,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
