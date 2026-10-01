import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/book_form_provider.dart';

/// Save, and on an existing Book, Hide / Show again with what hiding does.
class BookFormBar extends ConsumerStatefulWidget {
  const BookFormBar({super.key, required this.form, this.bookId});

  final BookForm form;
  final String? bookId;

  @override
  ConsumerState<BookFormBar> createState() => _BookFormBarState();
}

class _BookFormBarState extends ConsumerState<BookFormBar> {
  var _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final hidden = widget.form.hidden;
    return Container(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.md,
        Insets.screen,
        Insets.md,
      ),
      decoration: BoxDecoration(
        color: context.palette.surface,
        border: Border(top: BorderSide(color: context.palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: Insets.sm,
          children: [
            if (widget.bookId != null) ...[
              Text(l10n.adminCatalogHideHint, style: context.texts.bodySmall),
              SecondaryButton(
                label: hidden ? l10n.adminCatalogUnhide : l10n.adminCatalogHide,
                icon: Icon(
                  hidden
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  size: 18,
                ),
                onPressed: () => _run((n) async {
                  await n.setHidden(!hidden);
                  return true;
                }),
              ),
            ],
            PrimaryButton(
              label: l10n.adminCatalogSave,
              isBusy: _busy,
              onPressed: () => _run((n) async {
                if (await n.save() == null) return false;
                if (context.mounted) context.pop();
                return true;
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// Runs one action: "Saved" when it's done, "Couldn't save" when the
  /// server refuses it, nothing when the form shows problems.
  Future<void> _run(Future<bool> Function(BookFormNotifier) action) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    setState(() => _busy = true);
    try {
      final done = await action(
        ref.read(bookFormProvider(widget.bookId).notifier),
      );
      if (done) {
        messenger.showSnackBar(SnackBar(content: Text(l10n.adminCatalogSaved)));
      }
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.adminCatalogSaveFailed)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
