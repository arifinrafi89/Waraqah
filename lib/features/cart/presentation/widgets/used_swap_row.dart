import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/smart_basket.dart';
import 'smart_basket_actions.dart';

/// "Sapiens · Certified Used, Good · ৳420 · save ৳230" with Switch.
class UsedSwapRow extends ConsumerWidget {
  const UsedSwapRow({super.key, required this.swap});

  final UsedSwap swap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final kind = l10n.cartCertifiedUsed;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                swap.line.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.texts.titleSmall,
              ),
              Text(
                '$kind, ${l10n.conditionLabel(swap.copy.condition)} · '
                '${Bdt.format(swap.copy.priceBdt)} · '
                '${l10n.cartYouSave(Bdt.format(swap.savingBdt))}',
                style: AppFonts.ui(size: 11.5, color: palette.textDim),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => ref.applySwaps(context, [swap]),
          child: Text(l10n.cartSwitch),
        ),
      ],
    );
  }
}
