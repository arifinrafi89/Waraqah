import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/banner.dart';
import '../providers/home_providers.dart';
import 'banner_card.dart';

/// Banners loaded through their own provider: a swipeable carousel with page
/// dots, no autoplay.
class BannerCarousel extends ConsumerWidget {
  const BannerCarousel({super.key});

  static const double _aspectRatio = 2.4;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: Insets.lg),
      child: AsyncView(
        value: ref.watch(bannersProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(bannersProvider),
        skeleton: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.screen),
          child: ShimmerBox(aspectRatio: _aspectRatio, radius: Radii.hero),
        ),
        builder: (banners) =>
            banners.isEmpty ? const SizedBox() : _Pages(banners),
      ),
    );
  }
}

class _Pages extends StatefulWidget {
  const _Pages(this.banners);

  final List<Banner> banners;

  @override
  State<_Pages> createState() => _PagesState();
}

class _PagesState extends State<_Pages> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      spacing: Insets.sm,
      children: [
        AspectRatio(
          aspectRatio: BannerCarousel._aspectRatio,
          child: PageView(
            onPageChanged: (page) => setState(() => _page = page),
            children: [
              for (final banner in widget.banners)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.screen,
                  ),
                  child: BannerCard(banner: banner),
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            for (var i = 0; i < widget.banners.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: i == _page ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: i == _page ? palette.accent : palette.textFaint,
                  borderRadius: BorderRadius.circular(Radii.pill),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
