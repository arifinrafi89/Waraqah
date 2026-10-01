import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/presentation/widgets/listing_details_skeleton.dart';
import '../providers/handled_sale_providers.dart';
import '../widgets/sale_app_bar.dart';
import '../widgets/sale_details.dart';

/// `/sales/:id`: one handled sale, from the buyer's or the seller's side.
/// Pull down to see if the other side has moved it on.
class SalePage extends ConsumerWidget {
  const SalePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SaleAppBar(title: l10n.usedSaleTitle),
              Expanded(
                child: AsyncView(
                  value: ref.watch(saleProvider(id)),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(saleProvider(id)),
                  skeleton: const ListingDetailsSkeleton(),
                  builder: (sale) => sale == null
                      ? Padding(
                          padding: const EdgeInsets.all(Insets.xl),
                          child: Text(l10n.commonNotFound),
                        )
                      : RefreshIndicator(
                          onRefresh: () => ref.refresh(saleProvider(id).future),
                          child: SaleDetails(sale: sale),
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
