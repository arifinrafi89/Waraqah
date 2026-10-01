import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../inbox_routes.dart';
import '../providers/thread_providers.dart';
import '../widgets/inbox_skeleton.dart';
import '../widgets/thread_body.dart';

/// `/p2p/inbox/:id`: one buyer and one seller about one listing. The book
/// is pinned on top; offers, replies and the deal's status all happen here.
class ThreadPage extends ConsumerWidget {
  const ThreadPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final thread = ref.watch(threadProvider(id));
    final loaded = thread.value;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 8),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(InboxRoutes.inbox),
                  ),
                  if (loaded != null)
                    Expanded(child: _Who(thread: loaded))
                  else
                    const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: thread,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(threadProvider(id)),
                skeleton: const InboxSkeleton(rows: 3),
                builder: (thread) => thread == null
                    ? Center(child: Text(l10n.inboxMissing))
                    : ThreadBody(thread: thread),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Who extends StatelessWidget {
  const _Who({required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          thread.otherName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.texts.titleLarge,
        ),
        Text(
          thread.isBuying ? l10n.inboxBuying : l10n.inboxSelling,
          style: AppFonts.ui(
            size: 11,
            weight: FontWeight.w700,
            color: context.palette.textFaint,
          ),
        ),
      ],
    );
  }
}
