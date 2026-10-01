import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/async_view.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_providers.dart';
import '../widgets/p2p_marketplace_cover.dart';

class P2pListingDetailPage extends ConsumerWidget {
  const P2pListingDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingAsync = ref.watch(p2pListingDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing Details'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: AsyncView(
        value: listingAsync,
        errorLabel: 'Failed to load listing',
        retryLabel: 'Retry',
        builder: (listing) {
          if (listing == null) return const Center(child: Text('Not found'));
          return _buildBody(context, listing);
        },
        skeleton: const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: listingAsync.hasValue && listingAsync.value != null
          ? _buildBottomBar(context, listingAsync.value!)
          : null,
    );
  }

  Widget _buildBody(BuildContext context, P2pListing listing) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 240,
              width: 160,
              child: P2pMarketplaceCover(listing: listing),
            ),
          ),
          const SizedBox(height: Insets.xl),
          Text(
            listing.title,
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Insets.sm),
          Text(
            listing.sellerLine,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: Insets.lg),
          _buildInfoRow(context, 'Condition', listing.conditionLabel),
          if (listing.district != null && listing.area != null)
            _buildInfoRow(
              context,
              'Location',
              '${listing.area}, ${listing.district}',
            ),
          if (listing.category != null)
            _buildInfoRow(context, 'Category', listing.category!),
          const SizedBox(height: Insets.lg),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                Bdt.format(listing.priceBdt),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: context.palette.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (listing.saveAmount != null) ...[
                const SizedBox(width: Insets.md),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(Radii.sm),
                  ),
                  child: Text(
                    'Save ${Bdt.format(listing.saveAmount!)} vs new',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: Insets.xl),
          const Text(
            'Seller Notes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: Insets.sm),
          Text(
            'Used for one semester. Good condition, no markings.',
            style: TextStyle(color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.sm),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, P2pListing listing) {
    return Container(
      padding: const EdgeInsets.all(Insets.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Make Offer'),
              ),
            ),
            const SizedBox(width: Insets.md),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Message Seller'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
