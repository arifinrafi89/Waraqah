import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/theme/theme_family.dart';
import '../../../../core/models/book.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../domain/models/p2p_listing.dart';
import '../../domain/models/post.dart';
import '../../domain/models/profile.dart';
import '../controllers/home_controller.dart';
import '../widgets/ayah_card.dart';

const _gutter = 18.0;

extension _ThemeFamilyLabel on ThemeFamily {
  String get label {
    switch (this) {
      case ThemeFamily.forest:
        return 'Forest';
      case ThemeFamily.nord:
        return 'Nord';
      case ThemeFamily.tokyoNight:
        return 'Tokyo Night';
      case ThemeFamily.tokyoDay:
        return 'Tokyo Day';
      case ThemeFamily.catppuccinMocha:
        return 'Mocha';
      case ThemeFamily.catppuccinLatte:
        return 'Latte';
    }
  }
}

extension _P2pConditionLabel on P2pCondition {
  String get label {
    switch (this) {
      case P2pCondition.likeNew:
        return 'Like New';
      case P2pCondition.good:
        return 'Good';
      case P2pCondition.fair:
        return 'Fair';
    }
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;

    return Scaffold(
      backgroundColor: palette.bg,
      extendBody: true,
      appBar: _HomeAppBar(palette: palette),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 4)),
                const SliverToBoxAdapter(child: AyahCard()),
                const SliverToBoxAdapter(child: _FilterChipRow()),
                SliverToBoxAdapter(
                  child: _Section(
                    title: 'Book-Bites',
                    subtitle: 'What readers are sharing',
                    trailing: 'See all',
                    child: const _BookBitesStrip(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _Section(
                    title: 'New Books',
                    subtitle: 'Cheapest price across vendors',
                    trailing: 'Sort',
                    child: const _NewBooksGrid(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _Section(
                    title: 'From Students Near You',
                    subtitle: 'Second-hand · IUT campus',
                    trailing: 'See all',
                    child: const _P2pStrip(),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 140)),
              ],
            ),
          ),
          const Positioned(right: 18, bottom: 92, child: _AiFab()),
          const Positioned(left: 14, right: 14, bottom: 16, child: _GlassBottomNav()),
        ],
      ),
    );
  }
}

class _HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _HomeAppBar({required this.palette});

  final AppPalette palette;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);
    final families = ThemeFamily.familiesFor(themeState.mode);
    final isDark = themeState.mode == ThemeMode.dark;

    return AppBar(
      titleSpacing: _gutter,
      title: RichText(
        text: TextSpan(
          style: AppTheme.wordmarkTextStyle(palette).copyWith(fontSize: 23),
          children: [
            const TextSpan(text: 'Waraqa'),
            TextSpan(text: 'ﮪ', style: TextStyle(color: palette.accent)),
          ],
        ),
      ),
      actions: [
        IconButton(
          tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
          icon: Icon(isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
          color: palette.textDim,
          onPressed: () =>
              themeController.setMode(isDark ? ThemeMode.light : ThemeMode.dark),
        ),
        PopupMenuButton<ThemeFamily>(
          tooltip: 'Theme family',
          icon: Icon(Icons.palette_outlined, color: palette.textDim),
          initialValue: themeState.activeFamily,
          onSelected: themeController.setFamily,
          itemBuilder: (context) => [
            for (final family in families)
              PopupMenuItem(value: family, child: Text(family.label)),
          ],
        ),
        _AppBarIconButton(
          icon: Icons.search_rounded,
          onTap: () => context.pushNamed('search'),
        ),
        _AppBarIconButton(
          icon: Icons.shopping_bag_outlined,
          badgeCount: 2,
          onTap: () => context.pushNamed('cart'),
        ),
        const SizedBox(width: _gutter - 8),
      ],
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  const _AppBarIconButton({required this.icon, required this.onTap, this.badgeCount});

  final IconData icon;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: palette.surface,
            border: Border.all(color: palette.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Icon(icon, size: 18, color: palette.textDim),
              if (badgeCount != null)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: palette.accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: palette.bg, width: 2),
                    ),
                    child: Text(
                      '$badgeCount',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: palette.accentInk,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChipRow extends ConsumerWidget {
  const _FilterChipRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final selected = ref.watch(homeBookFilterProvider);

    Widget chip(HomeBookFilter filter, String label) {
      final active = selected == filter;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => ref.read(homeBookFilterProvider.notifier).state = filter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: active ? palette.accent : palette.surface,
              border: Border.all(color: active ? palette.accent : palette.border),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: active ? palette.accentInk : palette.textDim,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(_gutter, 16, _gutter, 0),
      child: Row(
        children: [
          chip(HomeBookFilter.all, 'All Books'),
          chip(HomeBookFilter.beneficial, 'Beneficial'),
          chip(HomeBookFilter.nonBeneficial, 'Non-Beneficial'),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.child,
  });

  final String title;
  final String subtitle;
  final String trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _gutter),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: palette.text,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: palette.textFaint,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      trailing,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w800,
                        color: palette.accent,
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, size: 14, color: palette.accent),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          child,
        ],
      ),
    );
  }
}

/// Cover gradient block: [color] to a ~55%-darkened [color], per design brief.
class _CoverGradient extends StatelessWidget {
  const _CoverGradient({required this.color, this.child});

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, Color.lerp(color, Colors.black, 0.45)!],
        ),
      ),
      child: child,
    );
  }
}

class _BookBitesStrip extends ConsumerWidget {
  const _BookBitesStrip();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final posts = ref.watch(postsProvider);
    final profiles = {for (final p in ref.watch(profilesProvider)) p.id: p};
    final books = {for (final b in ref.watch(booksProvider)) b.id: b};

    return SizedBox(
      height: 148,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: _gutter),
        itemCount: posts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final post = posts[index];
          final author = profiles[post.authorId];
          final taggedBook =
              post.taggedBookIds.isEmpty ? null : books[post.taggedBookIds.first];
          final chip = palette.chips[index % palette.chips.length];
          return _BiteCard(post: post, author: author, taggedBook: taggedBook, chip: chip);
        },
      ),
    );
  }
}

class _BiteCard extends StatelessWidget {
  const _BiteCard({required this.post, required this.author, required this.taggedBook, required this.chip});

  final Post post;
  final Profile? author;
  final Book? taggedBook;
  final Color chip;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final name = author?.fullName.split(' ').first ?? 'Reader';
    return Container(
      width: 196,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: chip,
                child: Text(
                  name.isEmpty ? '?' : name[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: palette.accentInk,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: palette.text),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      author?.university ?? '',
                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: palette.textFaint),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              post.content,
              style: TextStyle(fontSize: 12, height: 1.45, color: palette.textDim),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (taggedBook != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: palette.accentSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '📗 ${taggedBook!.title}',
                style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w800, color: palette.accent),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

class _NewBooksGrid extends ConsumerWidget {
  const _NewBooksGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final books = ref.watch(filteredBooksProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _gutter),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.62,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final chip = palette.chips[index % palette.chips.length];
          return _BookGridCard(book: book, chip: chip);
        },
      ),
    );
  }
}

class _BookGridCard extends StatelessWidget {
  const _BookGridCard({required this.book, required this.chip});

  final Book book;
  final Color chip;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: _CoverGradient(
              color: chip,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black.withValues(alpha: 0.72), Colors.transparent],
                          stops: const [0, 0.6],
                        ),
                      ),
                    ),
                  ),
                  if (book.isBest)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: palette.bg,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded, size: 9, color: palette.accent),
                            const SizedBox(width: 3),
                            Text(
                              'Best',
                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: palette.accent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13, height: 1.25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 10, 11, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: palette.textFaint),
                ),
                const SizedBox(height: 6),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  spacing: 6,
                  children: [
                    Text(
                      '৳${book.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        color: palette.text,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    if (book.originalPrice != null)
                      Text(
                        '৳${book.originalPrice!.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 11,
                          color: palette.textFaint,
                          decoration: TextDecoration.lineThrough,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: palette.surface2,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${book.vendorName} · lowest',
                    style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: palette.textDim),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _P2pStrip extends ConsumerWidget {
  const _P2pStrip();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final listings = ref.watch(p2pListingsProvider).where((l) => l.status == P2pStatus.available).toList();
    final books = {for (final b in ref.watch(booksProvider)) b.id: b};
    final profiles = {for (final p in ref.watch(profilesProvider)) p.id: p};

    return SizedBox(
      height: 245,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: _gutter),
        itemCount: listings.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final listing = listings[index];
          final book = books[listing.bookId];
          final seller = profiles[listing.sellerId];
          final chip = palette.chips[index % palette.chips.length];
          return _P2pCard(listing: listing, book: book, seller: seller, chip: chip);
        },
      ),
    );
  }
}

class _P2pCard extends StatelessWidget {
  const _P2pCard({required this.listing, required this.book, required this.seller, required this.chip});

  final P2pListing listing;
  final Book? book;
  final Profile? seller;
  final Color chip;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final title = book?.title ?? 'Untitled';
    final sellerFirstName = seller?.fullName.split(' ').first ?? 'Student';
    final batch = seller != null && seller!.studentId.length >= 2
        ? "'${seller!.studentId.substring(0, 2)}"
        : '';

    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: _CoverGradient(
              color: chip,
              child: Stack(
                children: [
                  Positioned(
                    top: 7,
                    right: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        listing.condition.label,
                        style: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.wordmarkTextStyle(palette).copyWith(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: palette.text, height: 1.3),
                ),
                const SizedBox(height: 5),
                Text(
                  '$sellerFirstName · $batch',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: palette.textFaint),
                ),
                const SizedBox(height: 4),
                Text(
                  '৳${listing.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: palette.accent,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AiFab extends StatelessWidget {
  const _AiFab();

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return SizedBox(
      width: 52,
      height: 52,
      child: Material(
        color: palette.accent,
        borderRadius: BorderRadius.circular(18),
        elevation: 6,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => context.pushNamed('ai-chat'),
          child: Icon(Icons.auto_awesome_rounded, color: palette.accentInk, size: 22),
        ),
      ),
    );
  }
}

class _GlassBottomNav extends StatelessWidget {
  const _GlassBottomNav();

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return GlassContainer(
      blur: 18,
      opacity: 0.55,
      color: palette.surface,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          _NavItem(icon: Icons.home_rounded, label: 'Home', active: true, onTap: () {}),
          _NavItem(
            icon: Icons.grid_view_rounded,
            label: 'Catalog',
            active: false,
            onTap: () => context.pushNamed('catalog'),
          ),
          _NavItem(
            icon: Icons.swap_horiz_rounded,
            label: 'P2P',
            active: false,
            onTap: () => context.pushNamed('p2p'),
          ),
          _NavItem(
            icon: Icons.forum_rounded,
            label: 'Bites',
            active: false,
            onTap: () => context.pushNamed('book-bites'),
          ),
          _NavItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            active: false,
            onTap: () => context.pushNamed('profile'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.active, required this.onTap});

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: active ? palette.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 19, color: active ? palette.accentInk : palette.textFaint),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  color: active ? palette.accentInk : palette.textFaint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
