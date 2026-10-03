import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';

/// A 0–100% slider with the value written out.
class PercentSlider extends StatelessWidget {
  const PercentSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(AppL10n.of(context)!.readingProgress(value.round())),
      Slider(value: value, max: 100, divisions: 20, onChanged: onChanged),
    ],
  );
}

/// The page the reader is on, and the Book's page count.
class PagesFields extends StatelessWidget {
  const PagesFields({
    super.key,
    required this.page,
    required this.total,
    required this.bad,
  });

  final TextEditingController page;
  final TextEditingController total;
  final bool bad;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    InputDecoration label(String text) => InputDecoration(labelText: text);
    final digits = [FilteringTextInputFormatter.digitsOnly];
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Insets.sm,
      children: [
        TextField(
          controller: page,
          keyboardType: TextInputType.number,
          inputFormatters: digits,
          decoration: label(l10n.readingPageRead),
        ),
        TextField(
          controller: total,
          keyboardType: TextInputType.number,
          inputFormatters: digits,
          decoration: label(l10n.readingTotalPages).copyWith(
            errorText: bad ? l10n.readingBadPages : null,
            errorMaxLines: 3,
          ),
        ),
      ],
    );
  }
}
