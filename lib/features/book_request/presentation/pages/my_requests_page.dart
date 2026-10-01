import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../book_request_routes.dart';
import '../providers/book_request_providers.dart';
import '../widgets/request_app_bar.dart';
import '../widgets/request_card.dart';
import '../widgets/requests_empty_view.dart';
import '../widgets/requests_skeleton.dart';

/// `/requests`: the books the reader asked for, how many copies match now,
/// and closing a request once it's found.
class MyRequestsPage extends ConsumerWidget {
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              RequestAppBar(
                title: l10n.requestMine,
                actions: [
                  AppIconButton(
                    icon: Icons.add_rounded,
                    tooltip: l10n.requestNew,
                    onPressed: () => context.push(BookRequestRoutes.newRequest),
                  ),
                ],
              ),
              Expanded(
                child: AsyncView(
                  value: ref.watch(myRequestsProvider),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(myRequestsProvider),
                  skeleton: const RequestsSkeleton(),
                  builder: (requests) => requests.isEmpty
                      ? const RequestsEmptyView()
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.screen,
                            0,
                            Insets.screen,
                            Insets.xl,
                          ),
                          itemCount: requests.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: Insets.md),
                          itemBuilder: (_, i) =>
                              RequestCard(request: requests[i]),
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
