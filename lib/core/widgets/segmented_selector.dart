import 'package:flutter/material.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Generic segmented control used by the Profile screen for theme mode and
/// language. Generic in the value type so callers stay type-safe.
class SegmentedSelector<T> extends StatelessWidget {
  const SegmentedSelector({
    super.key,
    required this.options,
    required this.labels,
    required this.value,
    required this.onChanged,
  });

  final List<T> options;
  final List<String> labels;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          for (var i = 0; i < options.length; i++)
            Expanded(
              child: InkWell(
                onTap: () => onChanged(options[i]),
                borderRadius: BorderRadius.circular(10),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(vertical: Insets.sm + 2),
                  decoration: BoxDecoration(
                    color: options[i] == value
                        ? palette.accent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    labels[i],
                    textAlign: TextAlign.center,
                    style: AppFonts.ui(
                      size: 12.5,
                      weight: FontWeight.w800,
                      color: options[i] == value
                          ? palette.accentInk
                          : palette.textFaint,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
