import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// One of a Booklist row's prices: [label] over the price, a tiny shimmer
/// while it loads, "—" when there's none or it failed. Tappable when
/// [onTap] is given and there's a price.
class BooklistPriceCell extends StatelessWidget {
  const BooklistPriceCell({
    super.key,
    required this.label,
    required this.price,
    this.caption,
    this.onTap,
  });

  final String label;
  final AsyncValue<int?> price;

  /// A faint line under the price (the New price's stock).
  final String? caption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final value = price.value;
    return InkWell(
      onTap: value == null ? null : onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.ui(size: 9.5, color: palette.textFaint),
            ),
            if (price.isLoading)
              const ShimmerBox(height: 14, width: 44, radius: 4)
            else
              Text(
                value == null ? '—' : Bdt.format(value),
                style: AppFonts.numeric(
                  size: 13,
                  color: value != null && onTap != null
                      ? palette.accent
                      : palette.text,
                ),
              ),
            if (caption != null)
              Text(
                caption!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.ui(size: 9, color: palette.textFaint),
              ),
          ],
        ),
      ),
    );
  }
}
