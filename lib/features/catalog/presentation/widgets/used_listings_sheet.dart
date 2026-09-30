import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/used_options.dart';
import 'used_labels.dart';

/// Readers selling this book, cheapest first. Answers the copy the reader
/// wants in their cart, or `null` if they close the sheet.
Future<UsedCopy?> showUsedListingsSheet(
  BuildContext context,
  List<UsedCopy> listings,
) => showModalBottomSheet<UsedCopy>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (sheet) {
    final palette = sheet.palette;
    final l10n = AppL10n.of(sheet)!;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          Insets.screen,
          0,
          Insets.screen,
          Insets.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.bookFromReaders, style: sheet.texts.titleMedium),
            const SizedBox(height: 4),
            Text(
              l10n.bookReaderSaleNote,
              style: AppFonts.ui(size: 12, color: palette.textDim),
            ),
            for (final copy in listings)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: palette.accentSoft,
                  child: Text(
                    copy.sellerName?.characters.first ?? '?',
                    style: AppFonts.ui(size: 14, color: palette.accent),
                  ),
                ),
                title: Text('${copy.sellerName} · ${copy.area}'),
                subtitle: Text(l10n.conditionLabel(copy.condition)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Bdt.format(copy.priceBdt),
                      style: AppFonts.numeric(size: 14, color: palette.text),
                    ),
                    IconButton(
                      tooltip: l10n.bookDetailAddToCart,
                      color: palette.accent,
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      onPressed: () => Navigator.pop(sheet, copy),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  },
);
