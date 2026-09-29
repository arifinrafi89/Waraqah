import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/p2p_listing.dart';

class P2pMarketplaceResultRow extends StatelessWidget {
  const P2pMarketplaceResultRow({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Insets.screen, Insets.md, Insets.screen, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${listings.length} listings',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: context.palette.textFaint,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort_rounded, size: 17),
            label: const Text('Sort'),
          ),
        ],
      ),
    );
  }
}
