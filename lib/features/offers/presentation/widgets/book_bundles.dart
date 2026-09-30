import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/offers_providers.dart';
import 'bundle_card.dart';

/// "Buy it in a bundle" on a book's page, for the bundles that include it.
/// Nothing when there are none.
class BookBundles extends ConsumerWidget {
  const BookBundles({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundles = ref.watch(bundlesForBookProvider(bookId));
    if (bundles.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          SectionHeader(title: AppL10n.of(context)!.offerInBundle),
          for (final bundle in bundles)
            BundleCard(key: ValueKey(bundle.id), bundle: bundle),
        ],
      ),
    );
  }
}
