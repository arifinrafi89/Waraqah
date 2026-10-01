import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/gift.dart';
import '../providers/gift_providers.dart';

/// Who the gift is for, the message on the card, and gift wrap.
class GiftFields extends ConsumerStatefulWidget {
  const GiftFields({super.key, required this.gift});

  final Gift gift;

  @override
  ConsumerState<GiftFields> createState() => _GiftFieldsState();
}

class _GiftFieldsState extends ConsumerState<GiftFields> {
  late final _name = TextEditingController(text: widget.gift.recipientName);
  late final _message = TextEditingController(text: widget.gift.message);

  @override
  void dispose() {
    _name.dispose();
    _message.dispose();
    super.dispose();
  }

  void _edit(Gift Function(Gift gift) change) =>
      ref.read(giftProvider.notifier).edit(change);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Radii.md),
      borderSide: BorderSide(color: palette.border),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, Insets.md, Insets.sm, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          AppTextField(
            label: l10n.checkoutGiftRecipient,
            hint: l10n.checkoutGiftRecipientHint,
            icon: Icons.person_outline_rounded,
            controller: _name,
            onChanged: (name) =>
                _edit((gift) => gift.copyWith(recipientName: name)),
          ),
          TextField(
            controller: _message,
            minLines: 2,
            maxLines: 4,
            maxLength: Gift.maxMessageLength,
            textCapitalization: TextCapitalization.sentences,
            style: AppFonts.ui(size: 13, color: palette.text),
            onChanged: (text) => _edit((gift) => gift.copyWith(message: text)),
            decoration: InputDecoration(
              hintText: l10n.checkoutGiftMessage,
              hintStyle: AppFonts.ui(size: 13, color: palette.textFaint),
              filled: true,
              fillColor: palette.surface,
              border: border,
              enabledBorder: border,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.checkoutGiftWrap,
                  style: context.texts.bodyMedium,
                ),
              ),
              Text(
                '+${Bdt.format(Gift.wrapFeeBdt)}',
                style: AppFonts.numeric(size: 13, color: palette.textDim),
              ),
              Switch(
                value: widget.gift.wrapped,
                onChanged: (wrap) =>
                    _edit((gift) => gift.copyWith(wrapped: wrap)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
