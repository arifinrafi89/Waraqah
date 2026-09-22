import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_palette.dart';
import '../../domain/models/p2p_listing.dart';
import '../controllers/p2p_controller.dart';
import 'p2p_grid_card.dart';

/// "All / Like New / Good / Fair" condition filter row, bound to
/// [p2pConditionFilterProvider].
class P2pConditionChipRow extends ConsumerWidget {
  const P2pConditionChipRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final selected = ref.watch(p2pConditionFilterProvider);

    Widget chip(P2pCondition? condition, String label) {
      final active = selected == condition;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => ref.read(p2pConditionFilterProvider.notifier).state = condition,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: active ? palette.accent : palette.surface,
              border: Border.all(color: active ? palette.accent : palette.border),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: active ? palette.accentInk : palette.textDim,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        chip(null, 'All'),
        chip(P2pCondition.likeNew, P2pCondition.likeNew.label),
        chip(P2pCondition.good, P2pCondition.good.label),
        chip(P2pCondition.fair, P2pCondition.fair.label),
      ],
    );
  }
}
