import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bites/presentation/providers/bite_providers.dart';
import '../../../bites/presentation/widgets/bite_card.dart';
import '../../../bites/presentation/widgets/bite_strip_skeleton.dart';
import '../widgets/home_section.dart';
import '../widgets/horizontal_strip.dart';

/// Preview strip of the Book-Bites feed. The cards and the provider belong to
/// the bites block; Home only composes them.
class BitesSection extends ConsumerWidget {
  const BitesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return HomeSection(
      title: l10n.homeBookBites,
      subtitle: l10n.homeBookBitesSub,
      actionLabel: l10n.commonSeeAll,
      onAction: () => context.go(AppRoutes.bites),
      topPadding: 20,
      child: AsyncView(
        value: ref.watch(biteFeedProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(biteFeedProvider),
        skeleton: const BiteStripSkeleton(),
        builder: (bites) => HorizontalStrip(
          children: [for (final bite in bites) BiteCard(bite: bite)],
        ),
      ),
    );
  }
}
