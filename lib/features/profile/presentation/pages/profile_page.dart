import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../../../home/domain/models/profile.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../../../p2p/presentation/widgets/p2p_grid_card.dart';
import '../controllers/profile_controller.dart';

const _gutter = 18.0;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final profile = ref.watch(currentProfileProvider);
    final listings = ref.watch(myListingsProvider);
    final books = {for (final b in ref.watch(booksProvider)) b.id: b};
    final profiles = {for (final p in ref.watch(profilesProvider)) p.id: p};

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileHeader(profile: profile),
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
                itemCount: listings.length,
                itemBuilder: (context, index) {
                  final listing = listings[index];
                  final book = books[listing.bookId];
                  final seller = profiles[listing.sellerId];
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
