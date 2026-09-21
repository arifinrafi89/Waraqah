import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/book_providers.dart';
import '../theme/app_palette.dart';

/// "Sort >" control that opens a menu to pick [BookSort], bound to
/// [sortProvider]. Shared between Home and Catalog.
class SortMenuButton extends ConsumerWidget {
  const SortMenuButton({super.key, required this.sortProvider});

  final StateProvider<BookSort> sortProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;

    return PopupMenuButton<BookSort>(
      tooltip: 'Sort',
      initialValue: ref.read(sortProvider),
      onSelected: (sort) => ref.read(sortProvider.notifier).state = sort,
      itemBuilder: (context) => const [
        PopupMenuItem(value: BookSort.none, child: Text('Default')),
        PopupMenuItem(value: BookSort.priceLowToHigh, child: Text('Price: Low to High')),
        PopupMenuItem(value: BookSort.ratingHighToLow, child: Text('Rating: High to Low')),
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
