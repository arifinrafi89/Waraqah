import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_return.dart';
import '../../domain/usecases/request_return.dart';
import 'order_labels.dart';
import 'return_photos_picker.dart';

/// What the reader filled in on the return sheet.
typedef ReturnChoice = ({
  ReturnReason reason,
  String note,
  List<Uint8List> photos,
});

/// Asks why the order is going back, for an optional note and up to three
/// photos. Answers the choice, or `null` if the reader closes the sheet.
Future<ReturnChoice?> showReturnSheet(BuildContext context) =>
    showModalBottomSheet<ReturnChoice>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const _ReturnForm(),
    );

class _ReturnForm extends StatefulWidget {
  const _ReturnForm();

  @override
  State<_ReturnForm> createState() => _ReturnFormState();
}

class _ReturnFormState extends State<_ReturnForm> {
  var _reason = ReturnReason.damaged;
  final _note = TextEditingController();
  var _photos = <Uint8List>[];

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.orderReturnWhy, style: context.texts.titleMedium),
          for (final reason in ReturnReason.values)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                reason == _reason
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: reason == _reason ? palette.accent : palette.textFaint,
              ),
              title: Text(l10n.returnReason(reason)),
              onTap: () => setState(() => _reason = reason),
            ),
          TextField(
            controller: _note,
            maxLines: 3,
            maxLength: RequestReturn.maxNoteLength,
            decoration: InputDecoration(
              hintText: l10n.orderReturnNoteHint,
              border: const OutlineInputBorder(),
            ),
          ),
          ReturnPhotosPicker(
            photos: _photos,
            onChanged: (photos) => setState(() => _photos = photos),
          ),
          const SizedBox(height: Insets.md),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              label: l10n.orderReturnSend,
              onPressed: () => Navigator.pop(context, (
                reason: _reason,
                note: _note.text,
                photos: _photos,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
