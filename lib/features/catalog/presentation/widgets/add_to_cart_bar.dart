import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/vendor_offer.dart';

/// Pinned bottom bar: the best price and vendor, plus the add-to-cart action.
///
/// The cart itself lands in Phase 8, so for now the button says so instead of
/// pretending to add anything.
class AddToCartBar extends StatelessWidget {
  const AddToCartBar({super.key, required this.offer});

  final VendorOffer? offer;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            Insets.md,
          ),
          child: Row(
            spacing: Insets.lg,
            children: [
              if (offer != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.bookDetailBestPrice,
                      style: AppFonts.ui(size: 10.5, color: palette.textFaint),
                    ),
                    Text(
                      Bdt.format(offer!.priceBdt),
                      style: AppFonts.numeric(size: 18, color: palette.text),
                    ),
                    Text(
                      offer!.vendor,
                      style: AppFonts.ui(size: 10.5, color: palette.accent),
                    ),
                  ],
                ),
              Expanded(
                child: PrimaryButton(
                  label: l10n.bookDetailAddToCart,
                  icon: Icons.add_shopping_cart_rounded,
                  onPressed: offer == null
                      ? null
                      : () => ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(content: Text(l10n.bookDetailCartSoon)),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
