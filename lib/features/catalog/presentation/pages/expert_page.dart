import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/expert_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/collection_strip.dart';
import '../widgets/expert_badge.dart';

/// `/catalog/expert/:id`: an Expert's name, credential, kind and verified
/// tick, then their Expert Picks.
class ExpertPage extends ConsumerWidget {
  const ExpertPage({super.key, required this.expertId});

  final String expertId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: ref.watch(expertProvider(expertId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(expertProvider(expertId)),
        skeleton: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [BackAppBar(), CollectionStripSkeleton()],
        ),
        builder: (detail) {
          if (detail == null) {
            return Column(
              children: [
                const BackAppBar(),
                Expanded(
                  child: NotFoundView(
                    label: l10n.commonNotFound,
                    backLabel: l10n.commonBack,
                    onBack: BackAppBar.goBack(context),
                  ),
                ),
              ],
            );
          }
          final expert = detail.expert;
          return ListView(
            padding: EdgeInsets.only(bottom: Sizes.navClearance),
            children: [
              BackAppBar(
                title: expert.label(isBangla),
                subtitle: expert.credential(isBangla),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
                child: Row(
                  spacing: Insets.sm,
                  children: [
                    MiniTag(label: expert.kind.label(l10n), fontSize: 11),
                    if (expert.verified)
                      ExpertBadge(expert: expert, text: l10n.expertVerified),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  Insets.xl,
                  Insets.screen,
                  0,
                ),
                child: SectionHeader(title: l10n.expertTheirPicks),
              ),
              CollectionStrip(collections: detail.picks),
            ],
          );
        },
      ),
    );
  }
}
