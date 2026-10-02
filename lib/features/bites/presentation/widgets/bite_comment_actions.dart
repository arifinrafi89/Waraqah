import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../providers/bite_providers.dart';

/// Commenting on a Bite, each telling the Reader when it fails.
extension BiteCommentUi on WidgetRef {
  /// `true` when the comment or reply was posted.
  Future<bool> commentOnBite(
    BuildContext context,
    String biteId,
    String text, {
    String? parentId,
  }) => _run(
    context,
    () =>
        read(postCommentProvider)
            .call((biteId: biteId, text: text, parentId: parentId)),
  );

  Future<void> deleteBiteComment(BuildContext context, String id) => _run(
    context,
    () => read(deleteCommentProvider).call(id),
    AppL10n.of(context)!.bitesCommentDeleted,
  );

  Future<bool> _run(
    BuildContext context,
    Future<Object?> Function() change, [
    String? done,
  ]) async {
    final messenger = ScaffoldMessenger.of(context);
    final failed = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await change();
      invalidate(biteDetailProvider);
      invalidate(bitesProvider);
      if (done != null) messenger.showSnackBar(SnackBar(content: Text(done)));
      return true;
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
      return false;
    }
  }
}
