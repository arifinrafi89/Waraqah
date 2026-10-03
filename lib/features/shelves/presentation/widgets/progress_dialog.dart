import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/progress_rules.dart';
import '../../domain/entities/shelf_entry.dart';
import 'progress_fields.dart';

/// "How far are you?": a percentage slider, or the page the reader is on
/// of the Book's total. `null` when cancelled.
Future<ProgressUpdate?> showProgressDialog(
  BuildContext context,
  ShelfEntry entry,
) => showDialog<ProgressUpdate>(
  context: context,
  builder: (_) => _ProgressDialog(entry),
);

class _ProgressDialog extends StatefulWidget {
  const _ProgressDialog(this.entry);

  final ShelfEntry entry;

  @override
  State<_ProgressDialog> createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<_ProgressDialog> {
  late bool _byPages = widget.entry.totalPages != null;
  late double _percent = widget.entry.progress.toDouble();
  late final _page = TextEditingController(
    text: '${widget.entry.pagesRead ?? ''}',
  );
  late final _total = TextEditingController(
    text: '${widget.entry.totalPages ?? ''}',
  );
  bool _bad = false;

  @override
  void dispose() {
    _page.dispose();
    _total.dispose();
    super.dispose();
  }

  void _save() {
    final pages = int.tryParse(_page.text.trim());
    final total = int.tryParse(_total.text.trim());
    final ProgressUpdate update = (
      bookId: widget.entry.book.id,
      percent: _byPages && pages != null && total != null
          ? ProgressRules.percentOf(pages, total)
          : _percent.round(),
      pagesRead: _byPages ? (pages ?? -1) : null,
      totalPages: _byPages ? (total ?? 0) : null,
    );
    if (ProgressRules.check(update) != null) {
      setState(() => _bad = true);
      return;
    }
    Navigator.pop(context, update);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AlertDialog(
      title: Text(l10n.readingUpdateTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: Insets.md,
        children: [
          SegmentedSelector<bool>(
            options: const [false, true],
            labels: [l10n.readingByPercent, l10n.readingByPages],
            value: _byPages,
            onChanged: (v) => setState(() => _byPages = v),
          ),
          if (_byPages)
            PagesFields(page: _page, total: _total, bad: _bad)
          else
            PercentSlider(
              value: _percent,
              onChanged: (v) => setState(() => _percent = v),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.readingCancel),
        ),
        FilledButton(onPressed: _save, child: Text(l10n.readingSave)),
      ],
    );
  }
}
