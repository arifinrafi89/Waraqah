import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../finished_it/presentation/widgets/finished_it_actions.dart';
import '../../domain/entities/shelf_entry.dart';
import '../providers/reading_providers.dart';
import '../providers/shelf_providers.dart';
import 'progress_dialog.dart';

/// How the shelves save reading progress and the yearly goal.
extension ProgressActions on WidgetRef {
  /// Asks how far the reader got in [entry]; at 100% the Book is
  /// finished, and the reader is offered to review, post or sell it.
  Future<void> updateProgress(BuildContext context, ShelfEntry entry) async {
    final update = await showProgressDialog(context, entry);
    if (update == null || !context.mounted) return;
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    try {
      final shelves = await read(updateProgressProvider).call(update);
      invalidate(shelvesProvider);
      messenger.showSnackBar(SnackBar(content: Text(l10n.readingSaved)));
      final now = shelves.where((e) => e.book.id == entry.book.id).first;
      if (now.shelf == Shelf.finished && context.mounted) {
        await bookFinished(context, entry.book.id);
      }
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  /// Saves the yearly goal. `false` when it didn't save.
  Future<bool> setReadingGoal(int goal) async {
    try {
      await read(setReadingGoalProvider).call(goal);
      invalidate(readingStatsProvider);
      return true;
    } catch (_) {
      return false;
    }
  }
}
