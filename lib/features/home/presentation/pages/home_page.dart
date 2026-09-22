import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../sections/ayah_section.dart';
import '../sections/benefit_filter_row.dart';
import '../sections/bites_section.dart';
import '../sections/nearby_p2p_section.dart';
import '../sections/new_books_section.dart';
import '../widgets/home_app_bar.dart';

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
              padding: const EdgeInsets.only(bottom: Sizes.navClearance),
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
