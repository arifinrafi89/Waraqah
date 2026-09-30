import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/fade_slide_in.dart';
import '../../../offers/presentation/widgets/offers_banner.dart';
import '../widgets/auto_hide_header.dart';
import '../widgets/ayah_section.dart';
import '../widgets/bites_section.dart';
import '../widgets/home_header.dart';
import '../widgets/nearby_p2p_section.dart';
import '../widgets/new_books_section.dart';

/// Screen 1 — Home. Nothing but composition: every section is an independent
/// brick that loads its own data, so one slow request never blocks the others.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + kHomeHeaderHeight;
    return AutoHideHeader(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: top)),
          const _Box(OffersBanner()),
          const _Box(AyahSection()),
          const _Box(BitesSection(), step: 1),
          const NewBooksSection(),
          const _Box(NearbyP2pSection(), step: 2),
          SliverToBoxAdapter(child: SizedBox(height: Sizes.navClearance)),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(this.child, {this.step = 0});

  final Widget child;

  /// Position in the entrance stagger.
  final int step;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: FadeSlideIn(
      delay: Duration(milliseconds: 60 * step),
      child: ContentWidth(child: child),
    ),
  );
}
