import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/booklist.dart';
import '../../domain/usecases/my_booklist.dart';
import '../providers/booklist_providers.dart';
import 'book_picker_sheet.dart';
import 'booklist_name_dialog.dart';

/// A Reader's own-list actions, each telling them when it fails.
extension MyBooklistUi on WidgetRef {
  /// Asks for a name, makes the list and opens it. Guests log in first.
  Future<void> newBooklist(BuildContext context) async {
    if (read(sessionProvider) == null) {
      await context.push(AuthRoutes.login);
      return;
    }
    final l10n = AppL10n.of(context)!;
    final name = await showBooklistNameDialog(context, title: l10n.booklistNew);
    if (name == null || !context.mounted) return;
    final made = await _change(context, (id: null, name: name, bookIds: null));
    if (made != null && context.mounted) {
      await context.push(CatalogRoutes.booklistFor(made.id));
    }
  }

  Future<void> renameBooklist(BuildContext context, Booklist list) async {
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final name = await showBooklistNameDialog(
      context,
      title: AppL10n.of(context)!.booklistRename,
      initial: list.title(isBangla),
    );
    if (name == null || !context.mounted) return;
    await _change(context, (id: list.id, name: name, bookIds: null));
  }

  /// Saves the list with [bookIds] in place of its books.
  Future<void> setBooklistBooks(
    BuildContext context,
    Booklist list,
    List<String> bookIds,
  ) => _change(context, (id: list.id, name: null, bookIds: bookIds));

  /// Opens the book picker; each tick adds or takes out a Book at once.
  Future<void> pickBooklistBooks(BuildContext context, Booklist list) {
    final ids = [for (final b in list.books) b.id];
    return showBookPickerSheet(
      context,
      picked: ids,
      onPick: (id, add) {
        add ? ids.add(id) : ids.remove(id);
        setBooklistBooks(context, list, [...ids]);
      },
    );
  }

  /// Asks first; goes back once it's gone.
  Future<void> deleteBooklist(BuildContext context, Booklist list) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final sure = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.booklistDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.booklistCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.booklistDelete),
          ),
        ],
      ),
    );
    if (sure != true || !context.mounted) return;
    final router = GoRouter.of(context);
    try {
      await read(myBooklistActionsProvider).delete(list.id);
      messenger.showSnackBar(SnackBar(content: Text(l10n.booklistDeleted)));
      router.canPop() ? router.pop() : router.go(CatalogRoutes.booklists);
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  Future<Booklist?> _change(BuildContext context, MyBooklistChange c) async {
    final messenger = ScaffoldMessenger.of(context);
    final failed = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      return await read(myBooklistActionsProvider).save(c);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
      return null;
    }
  }
}
