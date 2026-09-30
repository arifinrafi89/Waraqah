import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/gift.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/donation.dart';
import '../../domain/entities/recipient.dart';
import 'donate_action.dart';
import 'prepaid_picker.dart';
import 'quantity_stepper.dart';

/// How many copies, how to pay (not cash: the recipient doesn't pay) and a
/// note for the parcel, then Donate.
Future<void> showDonateSheet(
  BuildContext context,
  Recipient recipient,
  RecipientNeed need,
) => showModalBottomSheet<void>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (_) => _DonateSheet(recipient: recipient, need: need),
);

class _DonateSheet extends ConsumerStatefulWidget {
  const _DonateSheet({required this.recipient, required this.need});

  final Recipient recipient;
  final RecipientNeed need;

  @override
  ConsumerState<_DonateSheet> createState() => _DonateSheetState();
}

class _DonateSheetState extends ConsumerState<_DonateSheet> {
  final _note = TextEditingController();
  var _quantity = 1;
  var _payment = PaymentMethod.bkash;
  var _busy = false;

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _donate() async {
    final navigator = Navigator.of(context);
    setState(() => _busy = true);
    final request = DonationRequest(
      recipientId: widget.recipient.id,
      bookId: widget.need.book.id,
      quantity: _quantity,
      payment: _payment,
      note: _note.text,
    );
    final ok = await ref.donate(
      context,
      request,
      recipientName: widget.recipient.name,
    );
    if (ok) return navigator.pop();
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final label = AppFonts.ui(size: 12, color: palette.textDim);
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
          Text(widget.need.book.title, style: context.texts.titleMedium),
          Text(
            l10n.giftDonateFreeDelivery(widget.recipient.name),
            style: label,
          ),
          QuantityStepper(
            label: l10n.giftDonateHowMany,
            value: _quantity,
            max: widget.need.stillNeeded,
            onChanged: (value) => setState(() => _quantity = value),
          ),
          PrepaidPicker(
            value: _payment,
            onChanged: (method) => setState(() => _payment = method),
          ),
          TextField(
            controller: _note,
            maxLength: Gift.maxMessageLength,
            decoration: InputDecoration(hintText: l10n.giftDonateNote),
          ),
          PrimaryButton(
            label: l10n.giftDonateConfirm(
              Bdt.format(widget.need.priceBdt * _quantity),
            ),
            isBusy: _busy,
            onPressed: _busy ? null : _donate,
          ),
        ],
      ),
    );
  }
}
