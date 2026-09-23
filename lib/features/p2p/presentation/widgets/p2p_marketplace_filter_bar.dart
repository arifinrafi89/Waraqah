import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/filter_chip_bar.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_providers.dart';

class P2pMarketplaceFilterBar extends StatelessWidget {
  const P2pMarketplaceFilterBar({super.key, required this.filter, required this.ref});

  final P2pFilter filter;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final filters = [P2pFilter.all, P2pFilter.likeNew, P2pFilter.good, P2pFilter.fair];

    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: FilterChipBar(
        labels: filters.map((item) => item.label).toList(),
        selectedIndex: filters.indexOf(filter),
        onSelected: (index) => ref.read(p2pFilterProvider.notifier).select(filters[index]),
      ),
    );
  }
}
