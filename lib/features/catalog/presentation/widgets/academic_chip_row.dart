import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';

/// One titled, scrolling row of chips, e.g. Class: 6 · 7 · 8. The chips in
/// [selected] show as picked; the Section page picks one, Staff's form many.
class AcademicChipRow<T> extends StatelessWidget {
  const AcademicChipRow({
    super.key,
    required this.title,
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: Insets.screen),
  });

  final String title;
  final List<T> values;
  final Set<T> selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: padding,
        child: Row(
          children: [
            Center(child: Text(title, style: context.texts.labelLarge)),
            for (final value in values)
              Padding(
                padding: const EdgeInsets.only(left: Insets.sm),
                child: FilterChip(
                  label: Text(labelOf(value)),
                  selected: selected.contains(value),
                  onSelected: (_) => onTap(value),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
