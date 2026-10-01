import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/handled_sale_providers.dart';
import '../widgets/earnings_view.dart';
import '../widgets/sales_skeleton.dart';
import '../widgets/sale_app_bar.dart';

/// `/sales/earnings`: what the reader's handled sales brought in, what
/// Waraqah still holds, and payouts to bKash.
class EarningsPage extends ConsumerWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SaleAppBar(title: l10n.usedEarningsTitle),
              Expanded(
                child: AsyncView(
                  value: ref.watch(earningsProvider),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(earningsProvider),
                  skeleton: const SalesSkeleton(),
                  builder: (earnings) => EarningsView(earnings: earnings),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
