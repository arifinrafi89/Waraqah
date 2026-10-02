import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../../../bites/bites_routes.dart';
import '../../../catalog/catalog_routes.dart';
import '../../../p2p/p2p_routes.dart';
import '../../domain/entities/shelf_entry.dart';
import '../providers/shelf_providers.dart';
import '../widgets/shelf_book_tile.dart';

class ShelvesPage extends ConsumerWidget {
  const ShelvesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final shelves = ref.watch(shelvesProvider);
    final actions = ref.read(shelvesProvider.notifier);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(ProfileRoutes.profile),
                  ),
                  Text(l10n.shelvesTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: shelves,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(shelvesProvider),
                skeleton: const Padding(
                  padding: EdgeInsets.all(Insets.screen),
                  child: ShimmerBox(height: 150, radius: Radii.card),
                ),
                builder: (entries) => _ShelfBody(
                  entries: entries,
                  onMove: actions.move,
                  onProgress: actions.setProgress,
                  onFinished: (entry) => _showFinishedPrompt(context, entry),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showFinishedPrompt(
    BuildContext context,
    ShelfEntry entry,
  ) async {
    final l10n = AppL10n.of(context)!;
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (sheet) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l10n.readingFinishedPrompt(entry.title)),
              subtitle: Text(l10n.readingFinishedPromptMessage),
            ),
            ListTile(
              leading: const Icon(Icons.rate_review_outlined),
              title: Text(l10n.readingWriteReview),
              onTap: () => Navigator.pop(sheet, 'review'),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note_rounded),
              title: Text(l10n.readingPostBite),
              onTap: () => Navigator.pop(sheet, 'bite'),
            ),
            ListTile(
              leading: const Icon(Icons.sell_outlined),
              title: Text(l10n.readingSellBook),
              onTap: () => Navigator.pop(sheet, 'sell'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || entry.bookId == null || action == null) return;
    switch (action) {
      case 'review':
        context.push(CatalogRoutes.bookDetailFor(entry.bookId!));
      case 'bite':
        context.go(BitesRoutes.bites);
      case 'sell':
        context.push(P2pRoutes.addListing);
    }
  }
}

class _ShelfBody extends StatefulWidget {
  const _ShelfBody({
    required this.entries,
    required this.onMove,
    required this.onProgress,
    required this.onFinished,
  });

  final List<ShelfEntry> entries;
  final void Function(String id, ShelfStatus status) onMove;
  final void Function(String id, double progress) onProgress;
  final ValueChanged<ShelfEntry> onFinished;

  @override
  State<_ShelfBody> createState() => _ShelfBodyState();
}

class _ShelfBodyState extends State<_ShelfBody> {
  ShelfStatus _status = ShelfStatus.wantToRead;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final visible = widget.entries
        .where((entry) => entry.status == _status)
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: SegmentedButton<ShelfStatus>(
            segments: [
              ButtonSegment(
                value: ShelfStatus.wantToRead,
                label: Text(l10n.shelvesWantToRead),
              ),
              ButtonSegment(
                value: ShelfStatus.reading,
                label: Text(l10n.shelvesReading),
              ),
              ButtonSegment(
                value: ShelfStatus.finished,
                label: Text(l10n.shelvesFinished),
              ),
            ],
            selected: {_status},
            onSelectionChanged: (value) =>
                setState(() => _status = value.first),
          ),
        ),
        Expanded(
          child: visible.isEmpty
              ? Center(child: Text(l10n.shelvesEmpty))
              : ListView.separated(
                  padding: const EdgeInsets.all(Insets.screen),
                  itemCount: visible.length,
                  separatorBuilder: (_, _) => const SizedBox(height: Insets.sm),
                  itemBuilder: (_, index) {
                    final entry = visible[index];
                    return ShelfBookTile(
                      key: ValueKey(entry.id),
                      entry: entry,
                      onMove: (status) {
                        widget.onMove(entry.id, status);
                        if (status == ShelfStatus.finished &&
                            entry.status != ShelfStatus.finished) {
                          widget.onFinished(entry);
                        }
                      },
                      onProgress: (progress) {
                        widget.onProgress(entry.id, progress);
                        if (progress >= 1 &&
                            entry.status != ShelfStatus.finished) {
                          widget.onFinished(entry);
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
