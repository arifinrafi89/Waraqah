import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/bite_actions.dart';
import '../widgets/bite_feed_tab.dart';

/// The Bites tab: For You and Following feeds, and the composer button.
class BitesPage extends ConsumerWidget {
  const BitesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.bitesTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.bitesForYou),
              Tab(text: l10n.bitesFollowing),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BiteFeedTab(following: false),
            BiteFeedTab(following: true),
          ],
        ),
        floatingActionButton: Padding(
          // Clears the glass nav bar, in the AI button's usual place.
          padding: EdgeInsets.only(bottom: Sizes.usesNavRail ? 0 : 76),
          child: FloatingActionButton(
            tooltip: l10n.bitesWrite,
            onPressed: () => ref.composeBite(context),
            child: const Icon(Icons.edit_rounded),
          ),
        ),
      ),
    );
  }
}
