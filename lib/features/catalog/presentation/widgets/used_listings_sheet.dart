import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import 'used_labels.dart';

/// Readers selling this book, cheapest first. Answers the listing the
/// reader wants to open (to make the seller an offer), or `null` if they
/// close the sheet.
Future<P2pListing?> showUsedListingsSheet(
  BuildContext context,
  List<P2pListing> listings,
) => showModalBottomSheet<P2pListing>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (sheet) {
    final palette = sheet.palette;
    final l10n = AppL10n.of(sheet)!;
    final sorted = [...listings]
      ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
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
            for (final listing in sorted)
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => Navigator.pop(sheet, listing),
                leading: CircleAvatar(
                  backgroundColor: palette.accentSoft,
                  child: Text(
                    listing.sellerName.characters.first,
                    style: AppFonts.ui(size: 14, color: palette.accent),
                  ),
                ),
                title: Text(
                  [
                    listing.sellerName,
                    ?(listing.area ?? listing.district),
                  ].join(' · '),
                ),
                subtitle: Text(l10n.conditionLabel(listing.condition)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Bdt.format(listing.priceBdt),
                      style: AppFonts.numeric(size: 14, color: palette.text),
                    ),
                    Icon(Icons.chevron_right_rounded, color: palette.textFaint),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  },
);
