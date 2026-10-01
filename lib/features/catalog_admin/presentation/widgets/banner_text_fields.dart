import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import 'admin_text_field.dart';

/// A Banner's title and subtitle in English and Bangla, in that order in
/// [text]. [titleError] shows under both titles.
class BannerTextFields extends StatelessWidget {
  const BannerTextFields({
    super.key,
    required this.text,
    required this.onChanged,
    this.titleError,
  });

  final List<String> text;
  final void Function(int index, String value) onChanged;
  final String? titleError;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final labels = [
      l10n.adminCatalogFieldTitleEn,
      l10n.adminCatalogFieldTitleBnBanner,
      l10n.adminCatalogFieldSubtitleEn,
      l10n.adminCatalogFieldSubtitleBn,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        for (final (i, label) in labels.indexed)
          AdminTextField(
            label: label,
            initialValue: text[i],
            error: i < 2 ? titleError : null,
            onChanged: (v) => onChanged(i, v),
          ),
      ],
    );
  }
}
