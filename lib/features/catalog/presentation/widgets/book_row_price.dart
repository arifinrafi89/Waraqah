import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';

/// A [BookListRow]'s bottom line: From-price on the left, stock on the right.
class BookRowPrice extends StatelessWidget {
  const BookRowPrice({super.key, required this.book, required this.stockLabel});

  final Book book;
  final String stockLabel;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            Bdt.format(book.fromPriceBdt),
            style: AppFonts.numeric(size: 14, color: palette.text),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              stockLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: AppFonts.ui(
                size: 9.5,
                weight: FontWeight.w700,
                color: palette.textFaint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
