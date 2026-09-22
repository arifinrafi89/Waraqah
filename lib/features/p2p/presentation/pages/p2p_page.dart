import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../controllers/p2p_controller.dart';
import '../widgets/p2p_condition_chip_row.dart';
import '../widgets/p2p_grid_card.dart';
import '../widgets/p2p_sort_menu_button.dart';

const _gutter = 18.0;

class P2pPage extends ConsumerWidget {
  const P2pPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final feed = ref.watch(p2pFeedProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('P2P')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 76),
        child: FloatingActionButton(
          onPressed: () => context.pushNamed('p2p-create'),
          child: const Icon(Icons.add),
        ),
      ),
      body: AsyncValueView(
        value: feed,
        data: (feed) => SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(child: P2pConditionChipRow()),
                    P2pSortMenuButton(),
                  ],
                ),
                const SizedBox(height: 14),
                ResponsiveBookGrid(
                  itemCount: feed.listings.length,
                  itemBuilder: (context, index) {
                    final listing = feed.listings[index];
                    final book = feed.books[listing.bookId];
                    final seller = feed.profiles[listing.sellerId];
                    final chip = palette.chips[index % palette.chips.length];
                    return P2pGridCard(
                      listing: listing,
                      book: book,
                      seller: seller,
                      chip: chip,
                      onTap: () => context.pushNamed(
                        'p2p-detail',
                        pathParameters: {'id': listing.id},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
