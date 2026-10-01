import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/entities/sell_back_rules.dart';
import 'sell_back_actions.dart';
import 'sell_back_book_row.dart';
import 'sell_back_condition_picker.dart';
import 'sell_back_quote_card.dart';

/// The chosen book, its condition, the instant quote and the pickup.
class SellBackForm extends ConsumerStatefulWidget {
  const SellBackForm({super.key, required this.book, required this.onChange});

  final SellBackBook book;
  final VoidCallback onChange;

  @override
  ConsumerState<SellBackForm> createState() => _SellBackFormState();
}

class _SellBackFormState extends ConsumerState<SellBackForm> {
  final _address = TextEditingController();
  BookCondition _condition = BookCondition.good;
  final Set<String> _flags = {};
  bool _sending = false;

  @override
  void dispose() {
    _address.dispose();
    super.dispose();
  }

  Future<void> _accept() async {
    setState(() => _sending = true);
    await ref.acceptQuote(
      context,
      SellBackDraft(
        bookId: widget.book.bookId,
        condition: _condition,
        flags: _flags.length,
        pickupAddress: _address.text,
      ),
    );
    if (mounted) setState(() => _sending = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final quote = SellBackRules.quote(
      widget.book.newPriceBdt,
      _condition,
      flags: _flags.length,
    );
    final ready = _address.text.trim().length >= SellBackRules.minAddress;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.lg,
      children: [
        SellBackBookRow(
          book: widget.book,
          trailing: TextButton(
            onPressed: widget.onChange,
            child: Text(l10n.sellBackChange),
          ),
        ),
        SellBackConditionPicker(
          condition: _condition,
          flags: _flags,
          onCondition: (c) => setState(() => _condition = c),
          onFlag: (f) => setState(
            () => _flags.contains(f) ? _flags.remove(f) : _flags.add(f),
          ),
        ),
        SellBackQuoteCard(quoteBdt: quote),
        AppTextField(
          label: l10n.sellBackAddress,
          hint: l10n.sellBackAddressHint,
          icon: Icons.home_outlined,
          controller: _address,
          onChanged: (_) => setState(() {}),
        ),
        PrimaryButton(
          label: l10n.sellBackAccept(Bdt.format(quote)),
          isBusy: _sending,
          onPressed: ready ? _accept : null,
        ),
      ],
    );
  }
}
