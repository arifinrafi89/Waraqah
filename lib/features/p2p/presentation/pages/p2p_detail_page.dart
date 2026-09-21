import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../widgets/p2p_grid_card.dart' show P2pConditionLabel;

/// Listing detail page for a single `/p2p/:id` entry, reusing the existing
/// `P2pListing` model — no new domain model/repo/provider.
class P2pDetailPage extends ConsumerWidget {
  const P2pDetailPage({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final listings = ref.watch(p2pListingsProvider);
    final listing = listings.where((l) => l.id == listingId).firstOrNull;

    if (listing == null) {
      return Scaffold(
        backgroundColor: palette.bg,
        appBar: AppBar(title: const Text('Listing')),
        body: Center(
          child: Text(
            'Listing not found',
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: palette.textDim),
          ),
        ),
      );
    }

    final book = ref
        .watch(booksProvider)
        .where((b) => b.id == listing.bookId)
        .firstOrNull;
    final seller = ref
        .watch(profilesProvider)
        .where((p) => p.id == listing.sellerId)
        .firstOrNull;
    final title = book?.title ?? 'Untitled';

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        palette.accent,
                        Color.lerp(palette.accent, Colors.black, 0.45)!,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppTheme.wordmarkTextStyle(
                          palette,
                        ).copyWith(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: palette.text,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (book != null) ...[
                const SizedBox(height: 6),
                Text(
                  book.author,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(color: palette.textFaint),
                ),
              ],
              const SizedBox(height: 14),
              Text(
                '৳${listing.price.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: palette.text,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: palette.surface,
                      border: Border.all(color: palette.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      listing.condition.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: palette.text,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Seller',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: palette.textDim),
              ),
              const SizedBox(height: 6),
              Text(
                seller?.fullName ?? 'Unknown seller',
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(color: palette.text, fontWeight: FontWeight.w700),
              ),
              if (seller != null)
                Text(
                  seller.university,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: palette.textFaint),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
