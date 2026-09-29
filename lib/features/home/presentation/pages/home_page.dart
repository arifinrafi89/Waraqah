import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../widgets/ayah_section.dart';
import '../widgets/benefit_filter_row.dart';
import '../widgets/bites_section.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/nearby_p2p_section.dart';
import '../widgets/new_books_section.dart';

/// Screen 1 — Home. Nothing but composition: every section is an independent
/// brick that loads its own data, so one slow request never blocks the others.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: Sizes.navClearance),
              children: const [
                AyahSection(),
                Padding(
                  padding: EdgeInsets.only(top: Insets.lg),
                  child: BenefitFilterRow(),
                ),
                BitesSection(),
                NewBooksSection(),
                NearbyP2pSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
