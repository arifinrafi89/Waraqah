import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../sell_back_routes.dart';
import '../providers/sell_back_providers.dart';
import '../widgets/sell_back_app_bar.dart';
import '../widgets/sell_back_book_row.dart';
import '../widgets/sell_back_labels.dart';

/// `/sell-back/mine`: the books the reader sold back and where each is.
class MySellBacksPage extends ConsumerWidget {
  const MySellBacksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SellBackAppBar(
                title: l10n.sellBackMine,
                actions: [
                  AppIconButton(
                    icon: Icons.add_rounded,
                    tooltip: l10n.sellBackTitle,
                    onPressed: () => context.push(SellBackRoutes.sellBack),
                  ),
                ],
              ),
              Expanded(
                child: AsyncView(
                  value: ref.watch(mySellBacksProvider),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(mySellBacksProvider),
                  skeleton: const Padding(
                    padding: EdgeInsets.all(Insets.screen),
                    child: Column(
                      spacing: Insets.md,
                      children: [
                        ShimmerBox(height: 72),
                        ShimmerBox(height: 72),
                      ],
                    ),
                  ),
                  builder: (list) => list.isEmpty
                      ? Center(child: Text(l10n.sellBackEmpty))
                      : ListView(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.screen,
                            0,
                            Insets.screen,
                            Insets.xl,
                          ),
                          children: [
                            for (final sb in list)
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: Insets.md,
                                ),
                                child: SurfaceCard(
                                  padding: const EdgeInsets.all(Insets.md),
                                  child: SellBackBookRow(
                                    book: sb.book,
                                    trailing: MiniTag(
                                      label: l10n.sellBackStatus(sb),
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
