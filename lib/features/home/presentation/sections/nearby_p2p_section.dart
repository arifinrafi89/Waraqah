import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../../p2p/presentation/widgets/p2p_card.dart';
import '../../../p2p/presentation/widgets/p2p_strip_skeleton.dart';
import '../widgets/home_section.dart';
import '../widgets/horizontal_strip.dart';

/// Second-hand listings from other students on campus, owned by the P2P block.
class NearbyP2pSection extends ConsumerWidget {
  const NearbyP2pSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return HomeSection(
      title: l10n.homeFromStudents,
      subtitle: l10n.homeFromStudentsSub,
      actionLabel: l10n.commonSeeAll,
      onAction: () => context.go(AppRoutes.p2p),
      child: AsyncView(
        value: ref.watch(nearbyListingsProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(nearbyListingsProvider),
        skeleton: const P2pStripSkeleton(),
        builder: (listings) => HorizontalStrip(
          children: [
            for (final listing in listings) P2pCard(listing: listing),
          ],
        ),
      ),
    );
  }
}
