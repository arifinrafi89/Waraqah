import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_palette.dart';
import '../controllers/p2p_controller.dart';

/// "Sort >" control that opens a menu to pick [P2pSort], bound to
/// [p2pSortProvider].
class P2pSortMenuButton extends ConsumerWidget {
  const P2pSortMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;

    return PopupMenuButton<P2pSort>(
      tooltip: 'Sort',
      initialValue: ref.read(p2pSortProvider),
      onSelected: (sort) => ref.read(p2pSortProvider.notifier).state = sort,
      itemBuilder: (context) => const [
        PopupMenuItem(value: P2pSort.none, child: Text('Default')),
        PopupMenuItem(value: P2pSort.priceLowToHigh, child: Text('Price: Low to High')),
        PopupMenuItem(value: P2pSort.priceHighToLow, child: Text('Price: High to Low')),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
          Icon(Icons.chevron_right_rounded, size: 14, color: palette.accent),
        ],
      ),
    );
  }
}
