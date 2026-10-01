import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/p2p_routes.dart';
import '../providers/inbox_providers.dart';
import '../widgets/inbox_empty_view.dart';
import '../widgets/inbox_skeleton.dart';
import '../widgets/thread_tile.dart';

/// `/p2p/inbox`: every offer and conversation about used books, buying and
/// selling, newest first. It updates live, so it's also the notifications.
class InboxPage extends ConsumerWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final unread = ref.watch(inboxUnreadProvider);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(P2pRoutes.p2p),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.inboxTitle, style: context.texts.titleLarge),
                        Text(
                          l10n.inboxUnread(unread),
                          style: AppFonts.ui(
                            size: 11,
                            weight: FontWeight.w700,
                            color: context.palette.textFaint,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(inboxProvider),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(inboxProvider),
                skeleton: const InboxSkeleton(),
                builder: (threads) => threads.isEmpty
                    ? const InboxEmptyView()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        itemCount: threads.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (_, i) => ThreadTile(
                          key: ValueKey(threads[i].id),
                          thread: threads[i],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
