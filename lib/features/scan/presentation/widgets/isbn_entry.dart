import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Typing the ISBN from the back of the book, when there's no camera or
/// the barcode won't read.
class IsbnEntry extends StatefulWidget {
  const IsbnEntry({super.key, required this.onSubmit, this.invalid = false});

  final ValueChanged<String> onSubmit;

  /// The last code tried wasn't an ISBN.
  final bool invalid;

  @override
  State<IsbnEntry> createState() => _IsbnEntryState();
}

class _IsbnEntryState extends State<IsbnEntry> {
  final _isbn = TextEditingController();

  @override
  void dispose() {
    _isbn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        AppTextField(
          label: l10n.scanIsbnLabel,
          hint: l10n.scanIsbnHint,
          icon: Icons.numbers_rounded,
          keyboardType: TextInputType.number,
          controller: _isbn,
          onSubmitted: widget.onSubmit,
        ),
        if (widget.invalid)
          Text(
            l10n.scanInvalid,
            style: AppFonts.ui(size: 11.5, color: context.palette.danger),
          ),
        SecondaryButton(
          label: l10n.scanFind,
          icon: const Icon(Icons.search_rounded, size: 18),
          onPressed: () => widget.onSubmit(_isbn.text),
        ),
      ],
    );
  }
}
