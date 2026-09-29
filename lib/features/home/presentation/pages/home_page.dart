import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/content_width.dart';
import '../widgets/ayah_section.dart';
import '../widgets/benefit_filter_header.dart';
import '../widgets/bites_section.dart';
import '../widgets/home_sliver_app_bar.dart';
import '../widgets/nearby_p2p_section.dart';
import '../widgets/new_books_section.dart';

/// Screen 1 — Home. Nothing but composition: every section is an independent
/// brick that loads its own data, so one slow request never blocks the others.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeSliverAppBar(),
        const BenefitFilterHeader(),
        const _Box(AyahSection()),
        const _Box(BitesSection()),
        const NewBooksSection(),
        const _Box(NearbyP2pSection()),
        SliverToBoxAdapter(child: SizedBox(height: Sizes.navClearance)),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      SliverToBoxAdapter(child: ContentWidth(child: child));
}
