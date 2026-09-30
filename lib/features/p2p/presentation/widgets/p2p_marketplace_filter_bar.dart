import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.md),
      child: Row(
        children: [
          _buildDropdown<BookCondition?>(
            value: condition,
            items: const [
              DropdownMenuItem(value: null, child: Text('Any Condition')),
              DropdownMenuItem(value: BookCondition.likeNew, child: Text('Like New')),
              DropdownMenuItem(value: BookCondition.veryGood, child: Text('Very Good')),
              DropdownMenuItem(value: BookCondition.good, child: Text('Good')),
              DropdownMenuItem(value: BookCondition.acceptable, child: Text('Acceptable')),
            ],
            onChanged: (val) => ref.read(p2pFilterConditionProvider.notifier).select(val),
          ),
          const SizedBox(width: Insets.sm),
          _buildDropdown<String?>(
            value: district,
            items: const [
              DropdownMenuItem(value: null, child: Text('All Locations')),
              DropdownMenuItem(value: 'Dhaka', child: Text('Dhaka')),
              DropdownMenuItem(value: 'Chattogram', child: Text('Chattogram')),
              DropdownMenuItem(value: 'Rajshahi', child: Text('Rajshahi')),
            ],
            onChanged: (val) => ref.read(p2pFilterDistrictProvider.notifier).select(val),
          ),
          const SizedBox(width: Insets.sm),
          _buildDropdown<String?>(
            value: category,
            items: const [
              DropdownMenuItem(value: null, child: Text('All Categories')),
              DropdownMenuItem(value: 'Software Engineering', child: Text('Software Engineering')),
              DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
              DropdownMenuItem(value: 'Algorithms', child: Text('Algorithms')),
              DropdownMenuItem(value: 'Engineering', child: Text('Engineering')),
            ],
            onChanged: (val) => ref.read(p2pFilterCategoryProvider.notifier).select(val),
          ),
          const SizedBox(width: Insets.sm),
          _buildDropdown<int?>(
            value: maxPrice,
            items: const [
              DropdownMenuItem(value: null, child: Text('Any Price')),
              DropdownMenuItem(value: 300, child: Text('Under ৳300')),
              DropdownMenuItem(value: 500, child: Text('Under ৳500')),
              DropdownMenuItem(value: 1000, child: Text('Under ৳1000')),
            ],
            onChanged: (val) => ref.read(p2pFilterMaxPriceProvider.notifier).select(val),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: Insets.md),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(Radii.md),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          icon: const Icon(Icons.arrow_drop_down, size: 20),
        ),
      ),
    );
  }
}
