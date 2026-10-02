import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite.dart';
import '../../domain/entities/bite_query.dart';
import '../providers/bite_providers.dart';
import 'bite_delete_dialog.dart';

/// A Reader's Bite actions, each telling them when it fails. Guests log in
/// first.
extension BiteUi on WidgetRef {
  bool _guest(BuildContext context) {
    if (read(sessionProvider) != null) return false;
    context.push(AuthRoutes.login);
    return true;
  }

  void composeBite(BuildContext context, {String? bookId}) {
    if (!_guest(context)) context.push(BitesRoutes.composeFor(bookId: bookId));
  }

  /// Posts or saves [draft]; `true` when it worked.
  Future<bool> saveBite(BuildContext context, BiteDraft draft) {
    final l10n = AppL10n.of(context)!;
    return _run(
      context,
      () => read(saveBiteProvider).call(draft),
      draft.id == null ? l10n.bitesPosted : l10n.bitesSaved,
    );
  }

  Future<void> likeBite(BuildContext context, Bite bite) async {
    if (_guest(context)) return;
    await _run(
      context,
      () => read(likeBiteProvider).call((id: bite.id, liked: !bite.liked)),
    );
  }

  Future<void> deleteBite(BuildContext context, Bite bite) async {
    if (!await confirmBiteDelete(context) || !context.mounted) return;
    await _run(
      context,
      () => read(deleteBiteProvider).call(bite.id),
      AppL10n.of(context)!.bitesDeleted,
    );
  }

  /// Copies the Bite's link and its first 80 characters.
  Future<void> shareBite(BuildContext context, Bite bite) async {
    final messenger = ScaffoldMessenger.of(context);
    final copied = AppL10n.of(context)!.bitesCopied;
    await Clipboard.setData(ClipboardData(text: biteShareText(bite)));
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(copied)));
  }

  /// Runs [change], reloads every feed and detail, and says [done].
  Future<bool> _run(
    BuildContext context,
    Future<Object?> Function() change, [
    String? done,
  ]) async {
    final messenger = ScaffoldMessenger.of(context);
    final failed = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await change();
      invalidate(bitesProvider);
      invalidate(biteDetailProvider);
      if (done != null) messenger.showSnackBar(SnackBar(content: Text(done)));
      return true;
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
      return false;
    }
  }
}

String biteShareText(Bite bite) {
  final text = bite.text.characters;
  final excerpt = text.length > 80 ? '${text.take(80)}…' : '$text';
  return 'https://waraqah.app/bites/${bite.id}\n$excerpt';
}
