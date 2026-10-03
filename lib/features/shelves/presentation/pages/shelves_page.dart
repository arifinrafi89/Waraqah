import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';
import '../../shelves_routes.dart';
import '../providers/shelf_providers.dart';
import '../widgets/shelf_labels.dart';
import '../widgets/shelf_list.dart';
import '../widgets/shelves_app_bar.dart';
import '../widgets/shelves_skeleton.dart';

/// `/shelves`: Want to Read, Reading and Finished, one at a time.
class ShelvesPage extends ConsumerWidget {
  const ShelvesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final shown = ref.watch(shownShelfProvider);
    final shelves = ref.watch(shelvesProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ShelvesAppBar(
              title: l10n.shelfTitle,
              actions: [
                AppIconButton(
                  icon: Icons.insights_rounded,
                  tooltip: l10n.readingStatsTitle,
                  onPressed: () => context.push(ShelvesRoutes.stats),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
              child: SegmentedSelector<Shelf>(
                options: Shelf.values,
                labels: [for (final s in Shelf.values) l10n.shelfName(s)],
                value: shown,
                onChanged: ref.read(shownShelfProvider.notifier).select,
              ),
            ),
            Expanded(
              child: AsyncView(
                value: shelves,
                skeleton: const ShelvesSkeleton(),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(shelvesProvider),
                builder: (entries) => RefreshIndicator(
                  onRefresh: () => ref.refresh(shelvesProvider.future),
                  child: ShelfList(shelf: shown, entries: entries),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
