import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/entities/chat_message.dart';

/// Vendor-by-vendor price rows inside an assistant reply. The winning row is
/// picked out in the accent colour.
class VendorQuoteTable extends StatelessWidget {
  const VendorQuoteTable({super.key, required this.quotes});

  final List<VendorQuote> quotes;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        spacing: 3,
        children: [
          for (final quote in quotes)
            Row(
              children: [
                Expanded(
                  child: Text(
                    quote.vendor,
                    style: AppFonts.ui(
                      size: 11.5,
                      weight: quote.isLowest
                          ? FontWeight.w800
                          : FontWeight.w600,
                      color: quote.isLowest ? palette.accent : palette.textDim,
                    ),
                  ),
                ),
                Text(
                  Bdt.format(quote.priceBdt),
                  style: AppFonts.numeric(
                    size: 11.5,
                    weight: quote.isLowest ? FontWeight.w800 : FontWeight.w600,
                    color: quote.isLowest ? palette.accent : palette.textDim,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
