import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../../../p2p/presentation/widgets/p2p_grid_card.dart';
import '../controllers/profile_controller.dart';

const _gutter = 18.0;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final page = ref.watch(profilePageProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Profile')),
      body: AsyncValueView(
        value: page,
        data: (page) => SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileHeader(profile: page.profile),
                const SizedBox(height: 18),
                const _MyOrdersRow(),
                const SizedBox(height: 22),
                Text(
                  'My Listings',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: palette.text,
                  ),
                ),
                const SizedBox(height: 11),
                ResponsiveBookGrid(
                  itemCount: page.listings.length,
                  itemBuilder: (context, index) {
                    final listing = page.listings[index];
                    final book = page.books[listing.bookId];
                    final seller = page.profiles[listing.sellerId];
                    final chip = palette.chips[index % palette.chips.length];
                    return P2pGridCard(
                      listing: listing,
                      book: book,
                      seller: seller,
                      chip: chip,
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

class _MyOrdersRow extends StatelessWidget {
  const _MyOrdersRow();

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return InkWell(
      onTap: () => context.pushNamed('orders'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: palette.surface,
          border: Border.all(color: palette.border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.receipt_long_rounded, size: 20, color: palette.textDim),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: palette.text,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 20, color: palette.textFaint),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: palette.accentSoft,
          child: Text(
            profile.fullName.isEmpty ? '?' : profile.fullName[0].toUpperCase(),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.fullName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: palette.text,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                profile.university,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: palette.textDim,
                ),
              ),
              Text(
                profile.studentId,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: palette.textFaint,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
