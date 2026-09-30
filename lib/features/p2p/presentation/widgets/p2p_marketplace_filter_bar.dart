import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_providers.dart';

class P2pMarketplaceFilterBar extends ConsumerWidget {
  const P2pMarketplaceFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final condition = ref.watch(p2pFilterConditionProvider);
    final district = ref.watch(p2pFilterDistrictProvider);
    final category = ref.watch(p2pFilterCategoryProvider);
    final maxPrice = ref.watch(p2pFilterMaxPriceProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.screen,
        vertical: Insets.md,
      ),
      child: Row(
        spacing: Insets.sm,
        children: [
          _FilterMenu<BookCondition?>(
            value: condition,
            label: condition == null
                ? 'Condition'
                : condition.name.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), ' '),
            items: const [
              PopupMenuItem(value: null, child: Text('Any Condition')),
              PopupMenuItem(
                value: BookCondition.likeNew,
                child: Text('Like New'),
              ),
              PopupMenuItem(
                value: BookCondition.veryGood,
                child: Text('Very Good'),
              ),
              PopupMenuItem(value: BookCondition.good, child: Text('Good')),
              PopupMenuItem(
                value: BookCondition.acceptable,
                child: Text('Acceptable'),
              ),
            ],
            onChanged: (val) =>
                ref.read(p2pFilterConditionProvider.notifier).select(val),
          ),
          _FilterMenu<String?>(
            value: district,
            label: district ?? 'Location',
            items: const [
              PopupMenuItem(value: null, child: Text('All Locations')),
              PopupMenuItem(value: 'Dhaka', child: Text('Dhaka')),
              PopupMenuItem(value: 'Chattogram', child: Text('Chattogram')),
              PopupMenuItem(value: 'Rajshahi', child: Text('Rajshahi')),
            ],
            onChanged: (val) =>
                ref.read(p2pFilterDistrictProvider.notifier).select(val),
          ),
          _FilterMenu<String?>(
            value: category,
            label: category ?? 'Category',
            items: const [
              PopupMenuItem(value: null, child: Text('All Categories')),
              PopupMenuItem(
                value: 'Software Engineering',
                child: Text('Software Engineering'),
              ),
              PopupMenuItem(
                value: 'Computer Science',
                child: Text('Computer Science'),
              ),
              PopupMenuItem(value: 'Algorithms', child: Text('Algorithms')),
              PopupMenuItem(value: 'Engineering', child: Text('Engineering')),
            ],
            onChanged: (val) =>
                ref.read(p2pFilterCategoryProvider.notifier).select(val),
          ),
          _FilterMenu<int?>(
            value: maxPrice,
            label: maxPrice == null ? 'Price' : 'Under ৳$maxPrice',
            items: const [
              PopupMenuItem(value: null, child: Text('Any Price')),
              PopupMenuItem(value: 300, child: Text('Under ৳300')),
              PopupMenuItem(value: 500, child: Text('Under ৳500')),
              PopupMenuItem(value: 1000, child: Text('Under ৳1000')),
            ],
            onChanged: (val) =>
                ref.read(p2pFilterMaxPriceProvider.notifier).select(val),
          ),
        ],
      ),
    );
  }
}

class _FilterMenu<T> extends StatelessWidget {
  const _FilterMenu({
    required this.value,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  final T? value;
  final String label;
  final List<PopupMenuEntry<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isActive = value != null;
    final fg = isActive ? palette.accentInk : palette.textDim;

    // Use string manipulation to capitalize the first letter of each word in label
    final formattedLabel = label
        .split(' ')
        .map((w) {
          if (w.isEmpty) return w;
          return '${w[0].toUpperCase()}${w.substring(1)}';
        })
        .join(' ');

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton<T>(
        initialValue: value,
        onSelected: onChanged,
        itemBuilder: (context) => items,
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.card),
        ),
        color: palette.surface,
        elevation: 8,
        tooltip: '',
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? palette.accent : palette.surface,
            border: Border.all(
              color: isActive ? palette.accent : palette.border,
            ),
            borderRadius: BorderRadius.circular(Radii.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              if (isActive)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
                ),
              Text(
                formattedLabel,
                style: AppFonts.ui(
                  size: 12.5,
                  weight: FontWeight.w700,
                  color: fg,
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: fg),
            ],
          ),
        ),
      ),
    );
  }
}
