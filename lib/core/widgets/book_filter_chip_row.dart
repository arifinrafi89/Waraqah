import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/book_providers.dart';
import '../theme/app_palette.dart';

/// "All Books / Beneficial / Non-Beneficial" filter chip row, bound to
/// [filterProvider]. Shared between Home and Catalog.
class BookFilterChipRow extends ConsumerWidget {
  const BookFilterChipRow({super.key, required this.filterProvider});

  final StateProvider<BookFilter> filterProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final selected = ref.watch(filterProvider);

    Widget chip(BookFilter filter, String label) {
      final active = selected == filter;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => ref.read(filterProvider.notifier).state = filter,
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
        chip(BookFilter.all, 'All Books'),
        chip(BookFilter.beneficial, 'Beneficial'),
        chip(BookFilter.nonBeneficial, 'Non-Beneficial'),
      ],
    );
  }
}
