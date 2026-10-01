import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/edition_labels.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_line.dart';

/// The books on an invoice: title, edition, how many at what price, and
/// the line's amount.
class InvoiceLines extends StatelessWidget {
  const InvoiceLines({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Insets.md,
      children: [for (final line in order.lines) _Line(line: line)],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.line});

  final OrderLine line;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final edition = [
      if (line.format case final format?) l10n.formatLabel(format),
      if (line.language case final language?) l10n.languageLabel(language),
    ].join(' · ');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.md,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(line.title, style: context.texts.titleSmall),
              Text(
                [
                  if (edition.isNotEmpty) edition,
                  l10n.orderInvoiceQuantity(
                    line.quantity,
                    Bdt.format(line.unitPriceBdt),
                  ),
                ].join(' · '),
                style: AppFonts.ui(size: 11.5, color: palette.textFaint),
              ),
            ],
          ),
        ),
        Text(
          Bdt.format(line.unitPriceBdt * line.quantity),
          style: AppFonts.numeric(size: 13, color: palette.text),
        ),
      ],
    );
  }
}
