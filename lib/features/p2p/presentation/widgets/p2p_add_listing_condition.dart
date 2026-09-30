import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';

class P2pAddListingCondition extends StatelessWidget {
  const P2pAddListingCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final options = ['Like New', 'Good', 'Fair'];

    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Condition', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: Insets.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in options)
                ChoiceChip(
                  label: Text(option),
                  selected: option == 'Like New',
                  onSelected: (_) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
