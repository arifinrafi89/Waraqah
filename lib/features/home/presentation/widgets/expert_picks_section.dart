import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/expert_providers.dart';
import '../../../catalog/presentation/widgets/collection_strip.dart';
import 'home_section.dart';

/// Expert Picks, from the catalog block, right after the Collections.
class ExpertPicksSection extends ConsumerWidget {
  const ExpertPicksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return HomeSection(
      title: l10n.expertPicksTitle,
      subtitle: l10n.expertPicksSub,
      child: AsyncView(
        value: ref.watch(expertPicksProvider(null)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(expertPicksProvider(null)),
        skeleton: const CollectionStripSkeleton(),
        builder: (list) => CollectionStrip(collections: list),
      ),
    );
  }
}
