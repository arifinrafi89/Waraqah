import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';

/// What the price-alert sheet answers: a target price in taka, or [off].
abstract final class PriceAlertChoice {
  static const int off = -1;
}

/// Pick a price between half of today's and today's, in ৳10 steps. Answers
/// the target, [PriceAlertChoice.off] to remove an existing alert, or
/// `null` if the sheet is closed.
Future<int?> showPriceAlertSheet(
  BuildContext context, {
  required int currentBdt,
  int? targetBdt,
}) => showModalBottomSheet<int>(
  context: context,
  showDragHandle: true,
  builder: (_) => _PriceAlertForm(currentBdt: currentBdt, targetBdt: targetBdt),
);

class _PriceAlertForm extends StatefulWidget {
  const _PriceAlertForm({required this.currentBdt, this.targetBdt});

  final int currentBdt;
  final int? targetBdt;

  @override
  State<_PriceAlertForm> createState() => _PriceAlertFormState();
}

class _PriceAlertFormState extends State<_PriceAlertForm> {
  late final int _min = _round(widget.currentBdt * 0.5);
  late final int _max = _round(widget.currentBdt.toDouble());
  late double _target = (widget.targetBdt ?? _round(widget.currentBdt * 0.9))
      .clamp(_min, _max)
      .toDouble();

  static int _round(double bdt) => (bdt / 10).round() * 10;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final target = _target.round();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Insets.screen,
          0,
          Insets.screen,
          Insets.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: Insets.sm,
          children: [
            Text(l10n.alertPriceTitle, style: context.texts.titleMedium),
            Text(
              l10n.alertPriceToday(Bdt.format(widget.currentBdt)),
              style: AppFonts.ui(size: 12, color: palette.textDim),
            ),
            Text(
              l10n.alertPriceWhen(Bdt.format(target)),
              style: AppFonts.numeric(size: 16, color: palette.text),
            ),
            Slider(
              value: _target,
              min: _min.toDouble(),
              max: _max.toDouble(),
              divisions: ((_max - _min) ~/ 10).clamp(1, 1000),
              label: Bdt.format(target),
              onChanged: (value) => setState(() => _target = value),
            ),
            PrimaryButton(
              label: l10n.alertSet,
              onPressed: () => Navigator.pop(context, target),
            ),
            if (widget.targetBdt != null)
              TextButton(
                onPressed: () => Navigator.pop(context, PriceAlertChoice.off),
                child: Text(l10n.alertTurnOff),
              ),
          ],
        ),
      ),
    );
  }
}
