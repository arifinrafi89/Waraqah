import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../orders/presentation/widgets/return_photos_picker.dart';
import '../../domain/entities/handled_sale.dart';
import 'sale_labels.dart';

/// "What's wrong with the book?": a reason, a note and up to three photos
/// for the moderator. Answers the dispute, or `null` when dismissed.
Future<DisputeDraft?> showDisputeSheet(BuildContext context, String saleId) =>
    showModalBottomSheet<DisputeDraft>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => _DisputeSheet(saleId),
    );

class _DisputeSheet extends StatefulWidget {
  const _DisputeSheet(this.saleId);

  final String saleId;

  @override
  State<_DisputeSheet> createState() => _DisputeSheetState();
}

class _DisputeSheetState extends State<_DisputeSheet> {
  final _note = TextEditingController();
  DisputeReason? _reason;
  List<Uint8List> _photos = const [];

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final reason = _reason;
    return SingleChildScrollView(
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
          Text(l10n.usedDisputeTitle, style: context.texts.titleMedium),
          Wrap(
            spacing: Insets.sm,
            runSpacing: Insets.sm,
            children: [
              for (final r in DisputeReason.values)
                ChoiceChip(
                  label: Text(l10n.disputeReason(r)),
                  selected: r == reason,
                  onSelected: (_) => setState(() => _reason = r),
                ),
            ],
          ),
          AppTextField(
            hint: l10n.usedDisputeNoteHint,
            icon: Icons.edit_note_rounded,
            controller: _note,
          ),
          // Returns and disputes take photos the same way.
          ReturnPhotosPicker(
            photos: _photos,
            onChanged: (photos) => setState(() => _photos = photos),
          ),
          PrimaryButton(
            label: l10n.usedDisputeSend,
            onPressed: reason == null
                ? null
                : () => Navigator.pop(
                    context,
                    DisputeDraft(
                      saleId: widget.saleId,
                      reason: reason,
                      note: _note.text,
                      photos: _photos,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
