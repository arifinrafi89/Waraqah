import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import 'sale_actions.dart';

/// The reader's move, if it's theirs: the seller sends the book; the buyer
/// cancels before that, then confirms or reports a problem.
class SaleActionBar extends ConsumerWidget {
  const SaleActionBar({super.key, required this.sale});

  final HandledSale sale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    void step(SaleStep step) => ref.stepSale(context, sale, step);
    final buttons = switch ((sale.isBuying, sale.status)) {
      (false, SaleStatus.paid) => [
        PrimaryButton(
          label: l10n.usedSaleSend,
          icon: Icons.local_shipping_outlined,
          onPressed: () => step(SaleStep.send),
        ),
      ],
      (true, SaleStatus.paid) => [
        TextButton(
          onPressed: () => step(SaleStep.cancel),
          style: TextButton.styleFrom(foregroundColor: context.palette.danger),
          child: Text(l10n.usedSaleCancel),
        ),
      ],
      (true, SaleStatus.sent) => [
        PrimaryButton(
          label: l10n.usedSaleConfirm,
          icon: Icons.check_rounded,
          onPressed: () => step(SaleStep.confirm),
        ),
        SecondaryButton(
          label: l10n.usedSaleProblem,
          onPressed: () => ref.disputeSale(context, sale),
        ),
      ],
      _ => const <Widget>[],
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: buttons,
    );
  }
}
