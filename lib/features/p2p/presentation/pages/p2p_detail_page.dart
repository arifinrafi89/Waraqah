import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../domain/models/p2p_listing.dart';
import '../controllers/p2p_controller.dart';
import '../widgets/p2p_grid_card.dart' show P2pConditionLabel;

/// Listing detail page for a single `/p2p/:id` entry, reusing the existing
/// `P2pListing` model — no new domain model/repo/provider.
class P2pDetailPage extends ConsumerWidget {
  const P2pDetailPage({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final detail = ref.watch(p2pListingDetailProvider(listingId));

    return AsyncValueView(
      value: detail,
      data: (detail) => _P2pDetailBody(palette: palette, detail: detail),
    );
  }
}

class _P2pDetailBody extends StatelessWidget {
  const _P2pDetailBody({required this.palette, required this.detail});

  final AppPalette palette;
  final ({P2pListing? listing, Book? book, Profile? seller}) detail;

  @override
  Widget build(BuildContext context) {
    final listing = detail.listing;
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

    final book = detail.book;
    final seller = detail.seller;
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
