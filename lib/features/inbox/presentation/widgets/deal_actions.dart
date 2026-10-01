import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import '../providers/thread_providers.dart';

/// The seller's deal decisions, each asked once more because the buyer is
/// told straight away. A refusal from the server is shown as a message.
extension DealActions on WidgetRef {
  Future<void> decideOffer(
    BuildContext context,
    InboxThread thread,
    Offer offer, {
    required bool accept,
  }) => _run(
    context,
    () =>
        read(threadProvider(thread.id).notifier).decide(offer, accept: accept),
  );

  Future<void> confirmMarkSold(BuildContext context, InboxThread thread) async {
    final l10n = AppL10n.of(context)!;
    if (!await _confirm(
      context,
      l10n.chatMarkSoldTitle,
      l10n.chatMarkSoldBody(thread.otherName),
      l10n.chatMarkSold,
    )) {
      return;
    }
    if (!context.mounted) return;
    await _run(
      context,
      () => read(threadProvider(thread.id).notifier).markSold(),
    );
  }

  Future<void> confirmRelease(BuildContext context, InboxThread thread) async {
    final l10n = AppL10n.of(context)!;
    if (!await _confirm(
      context,
      l10n.chatMakeAvailableTitle,
      l10n.chatMakeAvailableBody(thread.otherName),
      l10n.chatMakeAvailable,
    )) {
      return;
    }
    if (!context.mounted) return;
    await _run(
      context,
      () => read(threadProvider(thread.id).notifier).release(),
    );
  }

  Future<bool> _confirm(
    BuildContext context,
    String title,
    String body,
    String action,
  ) async =>
      await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: Text(MaterialLocalizations.of(dialog).cancelButtonLabel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: Text(action),
            ),
          ],
        ),
      ) ??
      false;

  Future<void> _run(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await action();
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
