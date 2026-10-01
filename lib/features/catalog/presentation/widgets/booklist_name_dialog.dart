import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

/// Asks for a list's name, filled with [initial]. Closes with the trimmed
/// name, or `null` when cancelled or left blank.
Future<String?> showBooklistNameDialog(
  BuildContext context, {
  required String title,
  String initial = '',
}) async {
  final name = await showDialog<String>(
    context: context,
    builder: (_) => _NameDialog(title: title, initial: initial),
  );
  final trimmed = name?.trim() ?? '';
  return trimmed.isEmpty ? null : trimmed;
}

class _NameDialog extends StatefulWidget {
  const _NameDialog({required this.title, required this.initial});

  final String title;
  final String initial;

  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  late final _name = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _name,
        autofocus: true,
        maxLength: 60,
        decoration: InputDecoration(hintText: l10n.booklistNameHint),
        onSubmitted: (v) => Navigator.pop(context, v),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.booklistCancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _name.text),
          child: Text(l10n.booklistSave),
        ),
      ],
    );
  }
}
