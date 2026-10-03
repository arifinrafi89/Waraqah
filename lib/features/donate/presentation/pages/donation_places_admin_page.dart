import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../../donate_admin_routes.dart';
import '../providers/donate_providers.dart';
import '../widgets/donate_admin_app_bar.dart';
import '../widgets/donate_skeleton.dart';
import '../widgets/place_admin_tile.dart';

/// Admin → Donation places: the verified places donors can give to.
/// Staff add, edit and remove them.
class DonationPlacesAdminPage extends ConsumerWidget {
  const DonationPlacesAdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(DonateAdminRoutes.newPlace),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.adminDonateAdd),
      ),
      body: SafeArea(
        child: Column(
          children: [
            DonateAdminAppBar(
              title: l10n.adminDonate,
              fallback: AdminRoutes.admin,
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(recipientsProvider),
                skeleton: const DonateSkeleton(),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(recipientsProvider),
                builder: (places) => places.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(Insets.xl),
                        child: Text(
                          l10n.adminDonateEmpty,
                          textAlign: TextAlign.center,
                          style: AppFonts.ui(
                            size: 13,
                            color: context.palette.textDim,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          Insets.sm,
                          Insets.screen,
                          96,
                        ),
                        itemCount: places.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: Insets.sm),
                        itemBuilder: (_, i) => PlaceAdminTile(place: places[i]),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
