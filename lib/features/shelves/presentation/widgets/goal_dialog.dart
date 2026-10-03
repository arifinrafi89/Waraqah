import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/progress_rules.dart';

/// Asks how many Books the reader means to finish this year. `null` when
/// cancelled.
Future<int?> showGoalDialog(BuildContext context, int? current) =>
    showDialog<int>(context: context, builder: (_) => _GoalDialog(current));

class _GoalDialog extends StatefulWidget {
  const _GoalDialog(this.current);

  final int? current;

  @override
  State<_GoalDialog> createState() => _GoalDialogState();
}

class _GoalDialogState extends State<_GoalDialog> {
  late final _field = TextEditingController(text: '${widget.current ?? 12}');
  bool _bad = false;

  @override
  void dispose() {
    _field.dispose();
    super.dispose();
  }

  void _save() {
    final goal = int.tryParse(_field.text.trim()) ?? 0;
    if (!ProgressRules.goalIsValid(goal)) {
      setState(() => _bad = true);
      return;
    }
    Navigator.pop(context, goal);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AlertDialog(
      title: Text(l10n.readingGoalSet),
      content: TextField(
        controller: _field,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: l10n.readingGoalField,
          errorText: _bad ? l10n.readingGoalBad : null,
        ),
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
