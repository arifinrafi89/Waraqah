import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/scan_providers.dart';
import 'scan_found_card.dart';
import 'scan_not_found.dart';

/// What the scanned ISBN turned out to be.
class ScanResult extends ConsumerWidget {
  const ScanResult({super.key, required this.isbn, required this.forSell});

  final String isbn;
  final bool forSell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(scannedBookProvider(isbn)),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(scannedBookProvider(isbn)),
      skeleton: const SurfaceCard(
        padding: EdgeInsets.all(Insets.md),
        child: Row(
          spacing: Insets.md,
          children: [
            SizedBox(width: 56, child: ShimmerBox(aspectRatio: 2 / 3)),
            Expanded(
              child: Column(
                spacing: 8,
                children: [ShimmerBox(height: 14), ShimmerBox(height: 10)],
              ),
            ),
          ],
        ),
      ),
      builder: (book) => book == null
          ? ScanNotFound(isbn: isbn, forSell: forSell)
          : ScanFoundCard(book: book, forSell: forSell),
    );
  }
}
