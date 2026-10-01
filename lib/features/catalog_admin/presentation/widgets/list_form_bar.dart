import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/list_form_provider.dart';

/// Save, and on an existing list, Delete after asking.
class ListFormBar extends ConsumerStatefulWidget {
  const ListFormBar({super.key, required this.formKey});

  final ListFormKey formKey;

  @override
  ConsumerState<ListFormBar> createState() => _ListFormBarState();
}

class _ListFormBarState extends ConsumerState<ListFormBar> {
  var _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Container(
      padding: const EdgeInsets.all(Insets.md),
      decoration: BoxDecoration(
        color: context.palette.surface,
        border: Border(top: BorderSide(color: context.palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          spacing: Insets.sm,
          children: [
            if (widget.formKey.id != null)
              Expanded(
                child: SecondaryButton(
                  label: l10n.adminCatalogDelete,
                  icon: const Icon(Icons.delete_outline_rounded, size: 18),
                  onPressed: _busy ? null : _delete,
                ),
              ),
            Expanded(
              child: PrimaryButton(
                label: l10n.adminCatalogSave,
                isBusy: _busy,
                onPressed: () => _run((n) => n.save(), l10n.adminCatalogSaved),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _delete() async {
    final l10n = AppL10n.of(context)!;
    final sure = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.adminCatalogDeleteListTitle),
        content: Text(l10n.adminCatalogDeleteListBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.adminCatalogCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.adminCatalogDelete),
          ),
        ],
      ),
    );
    if (sure != true) return;
    await _run((n) async {
      await n.delete();
      return true;
    }, l10n.adminCatalogDeleted);
  }

  /// Runs [action]; when it's done, says [done] and closes the builder.
  /// Nothing when the builder shows problems; "Couldn't save" when refused.
  Future<void> _run(
    Future<bool> Function(ListFormNotifier) action,
    String done,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    setState(() => _busy = true);
    try {
      if (await action(ref.read(listFormProvider(widget.formKey).notifier))) {
        messenger.showSnackBar(SnackBar(content: Text(done)));
        if (mounted) context.pop();
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
