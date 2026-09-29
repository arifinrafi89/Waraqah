import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/vendor_offer.dart';

/// One vendor row: name, edition and delivery on the left, price on the right.
class VendorOfferTile extends StatelessWidget {
  const VendorOfferTile({
    super.key,
    required this.offer,
    required this.isLowest,
  });

  final VendorOffer offer;
  final bool isLowest;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final priceColor = !offer.inStock
        ? palette.textFaint
        : (isLowest ? palette.accent : palette.text);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: Insets.md),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  offer.vendor,
                  style: AppFonts.ui(
                    size: 13,
                    weight: FontWeight.w800,
                    color: palette.text,
                  ),
                ),
                Text(
                  '${_format(l10n)} · ${_availability(l10n)}',
                  style: AppFonts.ui(size: 11, color: palette.textFaint),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 3,
            children: [
              Text(
                Bdt.format(offer.priceBdt),
                style: AppFonts.numeric(
                  size: 14.5,
                  color: priceColor,
                  decoration: offer.inStock ? null : TextDecoration.lineThrough,
                ),
              ),
              if (isLowest && offer.inStock) _LowestPill(l10n.bookDetailLowest),
            ],
          ),
        ],
      ),
    );
  }

  String _format(AppL10n l10n) => switch (offer.format) {
    BookFormat.paperback => l10n.bookFormatPaperback,
    BookFormat.hardcover => l10n.bookFormatHardcover,
    BookFormat.ebook => l10n.bookFormatEbook,
  };

  String _availability(AppL10n l10n) {
    if (!offer.inStock) return l10n.bookDetailOutOfStock;
    if (offer.format == BookFormat.ebook) return l10n.bookDetailInstant;
    return l10n.bookDetailDelivery(offer.deliveryDays);
  }
}

class _LowestPill extends StatelessWidget {
  const _LowestPill(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: palette.accentSoft,
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Text(
        label,
        style: AppFonts.ui(
          size: 9.5,
          weight: FontWeight.w800,
          color: palette.accent,
        ),
      ),
    );
  }
}
