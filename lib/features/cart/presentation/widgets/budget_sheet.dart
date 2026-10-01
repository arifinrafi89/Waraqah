import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/smart_basket.dart';

/// Budget mode: type a budget and see the cheapest mix of new and used
/// that fits it. Answers the swaps to make, or `null` if closed.
Future<List<UsedSwap>?> showBudgetSheet(
  BuildContext context,
  SmartBasket basket,
) => showModalBottomSheet<List<UsedSwap>>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) => _BudgetForm(basket: basket),
);

class _BudgetForm extends StatefulWidget {
  const _BudgetForm({required this.basket});

  final SmartBasket basket;

  @override
  State<_BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<_BudgetForm> {
  BudgetPlan? _plan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final plan = _plan;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(l10n.cartBudgetTitle, style: context.texts.titleMedium),
          AppTextField(
            label: l10n.cartBudgetLabel,
            hint: Bdt.format(widget.basket.subtotalBdt),
            keyboardType: TextInputType.number,
            onChanged: (text) => setState(() {
              final budget = int.tryParse(text.trim());
              _plan = budget == null ? null : widget.basket.planFor(budget);
            }),
          ),
          if (plan != null)
            Text(
              plan.fits
                  ? l10n.cartBudgetFits(
                      Bdt.format(plan.totalBdt),
                      plan.swaps.length,
                    )
                  : l10n.cartBudgetShort(Bdt.format(plan.totalBdt)),
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w700,
                color: plan.fits ? palette.accent : palette.danger,
              ),
            ),
          PrimaryButton(
            label: l10n.cartBudgetApply,
            onPressed: plan == null || plan.swaps.isEmpty
                ? null
                : () => Navigator.pop(context, plan.swaps),
          ),
        ],
      ),
    );
  }
}
