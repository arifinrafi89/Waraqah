import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/saved_address.dart';

enum AddressAction { edit, makeDefault, delete }

/// One saved address with its menu: Edit, Make default, Delete.
class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address, required this.onAction});

  final SavedAddress address;
  final ValueChanged<AddressAction> onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(Insets.md, Insets.md, 0, Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(Icons.location_on_outlined, color: palette.accent),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Row(
                  spacing: Insets.sm,
                  children: [
                    Flexible(
                      child: Text(
                        address.label,
                        style: context.texts.titleSmall,
                      ),
                    ),
                    if (address.isDefault)
                      AccentTag(label: l10n.profileDefaultAddress),
                  ],
                ),
                Text(
                  '${address.recipient} · ${address.phone}\n'
                  '${address.line}, ${address.upazila}, ${address.district}',
                  style: AppFonts.ui(size: 12, color: palette.textDim),
                ),
              ],
            ),
          ),
          PopupMenuButton<AddressAction>(
            tooltip: l10n.profileEditAddress,
            onSelected: onAction,
            itemBuilder: (_) => [
              PopupMenuItem(
                value: AddressAction.edit,
                child: Text(l10n.profileEditAddress),
              ),
              if (!address.isDefault)
                PopupMenuItem(
                  value: AddressAction.makeDefault,
                  child: Text(l10n.profileMakeDefault),
                ),
              PopupMenuItem(
                value: AddressAction.delete,
                child: Text(l10n.profileDeleteAddress),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
