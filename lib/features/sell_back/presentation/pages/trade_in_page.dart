import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../providers/sell_back_providers.dart';
import '../widgets/trade_in_card.dart';

/// `/admin/tradeIn`: Sell Back books that were picked up, to grade, pay
/// for and publish as Certified Used, or send back.
class TradeInPage extends ConsumerWidget {
  const TradeInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              ScreenAppBar(
                leading: Row(
                  spacing: Insets.md,
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back_rounded,
                      tooltip: MaterialLocalizations.of(context)
                          .backButtonTooltip,
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(AdminRoutes.admin),
                    ),
                    Text(
                      l10n.sellBackAdminTitle,
                      style: context.texts.titleLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AsyncView(
                  value: ref.watch(tradeInQueueProvider),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(tradeInQueueProvider),
                  skeleton: const Padding(
                    padding: EdgeInsets.all(Insets.screen),
                    child: Column(
                      spacing: Insets.md,
                      children: [
                        ShimmerBox(height: 160),
                        ShimmerBox(height: 160),
                      ],
                    ),
                  ),
                  builder: (queue) => queue.isEmpty
                      ? Center(child: Text(l10n.sellBackAdminEmpty))
                      : ListView.separated(
                          padding: const EdgeInsets.all(Insets.screen),
                          itemCount: queue.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: Insets.md),
                          itemBuilder: (_, i) => TradeInCard(
                            key: ValueKey(queue[i].id),
                            sellBack: queue[i],
                          ),
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
