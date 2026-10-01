import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/offer_rules.dart';
import 'offer_handover_picker.dart';

class OfferDraft {
  const OfferDraft(this.amountBdt, this.handover);

  final int amountBdt;
  final OfferHandover handover;
}

/// The short offer form: a price (just the asking price when it isn't
/// negotiable) and meetup or courier. Answers the offer, or `null`.
Future<OfferDraft?> showOfferSheet(
  BuildContext context, {
  required String sellerName,
  required int askingBdt,
  required bool negotiable,
  required HandoverMethod preferred,
}) => showModalBottomSheet<OfferDraft>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (_) => _OfferSheet(sellerName, askingBdt, negotiable, preferred),
);

class _OfferSheet extends StatefulWidget {
  const _OfferSheet(this.seller, this.asking, this.negotiable, this.preferred);

  final String seller;
  final int asking;
  final bool negotiable;
  final HandoverMethod preferred;

  @override
  State<_OfferSheet> createState() => _OfferSheetState();
}

class _OfferSheetState extends State<_OfferSheet> {
  late final _price = TextEditingController(text: '${widget.asking}');
  late var _handover = widget.preferred == HandoverMethod.delivery
      ? OfferHandover.courier
      : OfferHandover.meetup;

  @override
  void dispose() {
    _price.dispose();
    super.dispose();
  }

  int? get _amount => int.tryParse(_price.text.trim());

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final asking = Bdt.format(widget.asking);
    final problem = OfferRules.check(
      amountBdt: _amount,
      askingBdt: widget.asking,
      negotiable: widget.negotiable,
    );
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.lg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(l10n.offerMake, style: context.texts.titleMedium),
          Text(l10n.offerTo(widget.seller, asking), style: dim),
          if (widget.negotiable)
            AppTextField(
              label: l10n.offerYourPrice,
              hint: '${widget.asking}',
              icon: Icons.payments_outlined,
              keyboardType: TextInputType.number,
              controller: _price,
              onChanged: (_) => setState(() {}),
            )
          else
            Text(l10n.offerFixedPrice(widget.seller, asking), style: dim),
          if (problem == OfferProblem.aboveAsking)
            Text(
              l10n.offerTooHigh(asking),
              style: AppFonts.ui(size: 11.5, color: palette.danger),
            ),
          OfferHandoverPicker(
            value: _handover,
            note: l10n.offerSellerPrefers(widget.seller, widget.preferred.name),
            onChanged: (value) => setState(() => _handover = value),
          ),
          Text(l10n.bookReaderSaleNote, style: dim),
          PrimaryButton(
            label: l10n.offerSend,
            onPressed: problem == null
                ? () => Navigator.pop(context, OfferDraft(_amount!, _handover))
                : null,
          ),
        ],
      ),
    );
  }
}
