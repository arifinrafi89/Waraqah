import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../catalog/presentation/providers/book_detail_providers.dart';
import '../../domain/entities/review.dart';
import '../providers/review_providers.dart';
import 'review_sheet.dart';

/// Writing, editing and deleting "me"'s review. Guests log in first.
extension ReviewUi on WidgetRef {
  Future<void> writeReview(
    BuildContext context,
    String bookId, {
    Review? mine,
  }) async {
    if (read(sessionProvider) == null) {
      await context.push(AuthRoutes.login);
      return;
    }
    final input = await showReviewSheet(context, mine: mine);
    if (input == null || !context.mounted) return;
    await _run(
      context,
      bookId,
      () =>
          read(saveReviewProvider)
              .call((bookId: bookId, stars: input.stars, text: input.text)),
      AppL10n.of(context)!.reviewSaved,
    );
  }

  Future<void> deleteReview(BuildContext context, String bookId) async {
    final l10n = AppL10n.of(context)!;
    final sure = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.reviewDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.reviewCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.reviewDelete),
          ),
        ],
      ),
    );
    if (sure != true || !context.mounted) return;
    await _run(
      context,
      bookId,
      () => read(deleteReviewProvider).call(bookId),
      l10n.reviewDeleted,
    );
  }

  /// Reloads the reviews and the book page (its rating follows them).
  Future<void> _run(
    BuildContext context,
    String bookId,
    Future<Object?> Function() change,
    String done,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final failed = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await change();
      invalidate(bookReviewsProvider(bookId));
      invalidate(bookDetailProvider(bookId));
      messenger.showSnackBar(SnackBar(content: Text(done)));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
    }
  }
}
