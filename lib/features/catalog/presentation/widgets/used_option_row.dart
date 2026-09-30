import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// One way to buy used: an icon, what it is, a detail line, the price and a
/// trailing button (add to cart, or an arrow to see more).
class UsedOptionRow extends StatelessWidget {
  const UsedOptionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.price,
    required this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String detail;
  final String price;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Insets.md, 10, 4, 10),
        child: Row(
          spacing: Insets.md,
          children: [
            Icon(icon, color: palette.accent, size: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(title, style: context.texts.titleSmall),
                  Text(
                    detail,
                    style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                  ),
                ],
              ),
            ),
            Text(price, style: AppFonts.numeric(size: 14, color: palette.text)),
            trailing,
          ],
        ),
      ),
    );
  }
}
