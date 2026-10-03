import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/presentation/widgets/confirm_dialog.dart';
import '../../domain/entities/recipient.dart';
import '../../donate_admin_routes.dart';
import '../providers/donate_admin_providers.dart';
import '../providers/donate_providers.dart';

/// One verified place for Staff: name, kind and district, what it still
/// needs, and Edit or Remove.
class PlaceAdminTile extends ConsumerWidget {
  const PlaceAdminTile({super.key, required this.place});

  final Recipient place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final dim = AppFonts.ui(size: 12.5, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(Insets.md, Insets.sm, 0, Insets.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(place.name, style: context.texts.titleSmall),
                Text(
                  '${l10n.giftDonateKind(place.kind.name)} · ${place.district}',
                  style: dim,
                ),
                Text(
                  l10n.adminDonateStill(
                    place.booksStillNeeded,
                    place.booksWanted,
                  ),
                  style: dim,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: l10n.adminDonateEdit,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push(DonateAdminRoutes.placeFor(place.id)),
          ),
          IconButton(
            tooltip: l10n.adminDonateRemove,
            icon: Icon(Icons.delete_outline_rounded, color: palette.danger),
            onPressed: () => _remove(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _remove(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final sure = await confirmDialog(
      context,
      title: l10n.adminDonateRemoveTitle(place.name),
      message: l10n.adminDonateRemoveBody,
      confirm: l10n.adminDonateRemove,
    );
    if (!sure) return;
    try {
      await ref.read(removePlaceProvider).call(place.id);
      ref.invalidate(recipientsProvider);
      messenger.showSnackBar(SnackBar(content: Text(l10n.adminDonateRemoved)));
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }
}
