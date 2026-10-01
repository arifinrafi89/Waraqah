import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../providers/report_providers.dart';
import '../widgets/blocked_empty_view.dart';
import '../widgets/blocked_reader_tile.dart';
import '../widgets/blocked_readers_skeleton.dart';

/// `/blocked`: the readers the signed-in reader blocked, to unblock.
class BlockedReadersPage extends ConsumerWidget {
  const BlockedReadersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final blocked = ref.watch(blockedReadersProvider);
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
                child: Row(
                  spacing: Insets.md,
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back_rounded,
                      tooltip: MaterialLocalizations.of(context)
                          .backButtonTooltip,
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(ProfileRoutes.profile),
                    ),
                    Text(
                      l10n.reportBlockedTitle,
                      style: context.texts.titleLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AsyncView(
                  value: blocked,
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(blockedReadersProvider),
                  skeleton: const BlockedReadersSkeleton(),
                  builder: (readers) => readers.isEmpty
                      ? const BlockedEmptyView()
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.screen,
                            0,
                            Insets.screen,
                            Insets.xl,
                          ),
                          itemCount: readers.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: Insets.md),
                          itemBuilder: (_, i) =>
                              BlockedReaderTile(reader: readers[i]),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
