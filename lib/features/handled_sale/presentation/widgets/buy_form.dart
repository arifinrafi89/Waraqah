import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sale_math.dart';
import 'money_rows.dart';
import 'prepaid_picker.dart';
import 'sale_actions.dart';
import 'sale_book_row.dart';

/// The book, the money, how to pay, and Pay.
class BuyForm extends ConsumerStatefulWidget {
  const BuyForm({super.key, required this.listing});

  final P2pListing listing;

  @override
  ConsumerState<BuyForm> createState() => _BuyFormState();
}

class _BuyFormState extends ConsumerState<BuyForm> {
  PaymentMethod _method = PaymentMethod.bkash;
  bool _paying = false;

  Future<void> _pay() async {
    setState(() => _paying = true);
    await ref.buyListing(context, widget.listing.id, _method);
    if (mounted) setState(() => _paying = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final listing = widget.listing;
    final total = SaleMath.buyerPays(listing.priceBdt);
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        SaleBookRow(
          title: listing.title,
          coverSeed: listing.coverSeed,
          subtitle: l10n.usedSaleFrom(listing.sellerName),
        ),
        const SizedBox(height: Insets.lg),
        MoneyRows(
          rows: [
            (l10n.usedBuyBook, listing.priceBdt),
            (l10n.usedBuyDelivery, SaleMath.deliveryBdt),
            (l10n.usedBuyTotal, total),
          ],
        ),
        const SizedBox(height: Insets.sm),
        Text(
          l10n.usedBuyHeld,
          style: AppFonts.ui(size: 12, color: context.palette.accent),
        ),
        const SizedBox(height: Insets.lg),
        SectionHeader(title: l10n.usedBuyPayWith),
        PrepaidPicker(
          value: _method,
          onChanged: (method) => setState(() => _method = method),
        ),
        const SizedBox(height: Insets.lg),
        PrimaryButton(
          label: l10n.usedBuyPay(Bdt.format(total)),
          icon: Icons.lock_outline_rounded,
          isBusy: _paying,
          onPressed: _pay,
        ),
      ],
    );
  }
}
