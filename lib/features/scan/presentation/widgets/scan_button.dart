import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/presentation/providers/p2p_add_listing_notifier.dart';
import '../../domain/entities/scanned_book.dart';
import '../../scan_routes.dart';

/// Opens the barcode scanner. With [forSell] (on the add-listing form), the
/// scanned Book fills the form in; otherwise the reader chooses between
/// its book page and selling a copy. [wide] shows a full-width button.
class ScanButton extends ConsumerWidget {
  const ScanButton({super.key, this.forSell = false, this.wide = false});

  final bool forSell;
  final bool wide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = AppL10n.of(context)!.scanTitle;
    Future<void> open() async {
      final book = await context.push<ScannedBook>(
        ScanRoutes.scanFor(sell: forSell),
      );
      if (book == null) return;
      ref
          .read(p2pAddListingProvider.notifier)
          .fromBook(book.bookId, book.title, newPriceBdt: book.newPriceBdt);
    }

    return wide
        ? SecondaryButton(
            label: label,
            icon: const Icon(Icons.qr_code_scanner_rounded, size: 18),
            onPressed: open,
          )
        : AppIconButton(
            icon: Icons.qr_code_scanner_rounded,
            tooltip: label,
            onPressed: open,
          );
  }
}
