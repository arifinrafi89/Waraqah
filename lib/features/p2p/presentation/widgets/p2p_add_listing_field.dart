import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';

class P2pAddListingField extends StatelessWidget {
  const P2pAddListingField({
    super.key,
    required this.label,
    required this.hint,
    this.onChanged,
    this.initialValue,
  });

  final String label;
  final String hint;
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: Insets.sm),
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
