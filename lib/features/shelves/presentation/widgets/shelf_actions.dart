import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../finished_it/presentation/widgets/finished_it_actions.dart';
import '../../domain/entities/shelf_entry.dart';
import '../providers/shelf_providers.dart';
import 'shelf_labels.dart';

/// How any page puts a Book on a shelf. Guests log in first.
extension ShelfActions on WidgetRef {
  /// Moves [bookId] to [shelf], or off every shelf when `null`. Finishing
  /// a Book suggests selling it on.
  Future<void> moveToShelf(
    BuildContext context,
    String bookId,
    Shelf? shelf,
  ) async {
    if (read(sessionProvider) == null) {
      GoRouter.of(context).push(AuthRoutes.login);
      return;
    }
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await read(moveToShelfProvider).call((bookId: bookId, shelf: shelf));
      invalidate(shelvesProvider);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            shelf == null
                ? l10n.shelfRemoved
                : l10n.shelfMoved(l10n.shelfName(shelf)),
          ),
        ),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
      return;
    }
    if (shelf == Shelf.finished && context.mounted) {
      await bookFinished(context, bookId);
    }
  }
}
