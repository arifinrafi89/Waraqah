import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_add_listing_notifier.dart';
import 'fair_price_meter.dart';
import 'p2p_add_listing_field.dart';

/// Step 4: the price with the fair price meter, negotiable, and how the
/// book changes hands.
class ListingPriceStep extends ConsumerWidget {
  const ListingPriceStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final draft = ref.watch(p2pAddListingProvider);
    final notifier = ref.read(p2pAddListingProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        P2pAddListingField(
          label: l10n.listingPrice,
          hint: l10n.listingPriceHint,
          initialValue: draft.priceBdt > 0 ? '${draft.priceBdt}' : null,
          onChanged: (val) => notifier.updatePrice(int.tryParse(val) ?? 0),
        ),
        const FairPriceMeter(),
        const SizedBox(height: Insets.sm),
        SwitchListTile(
          title: Text(l10n.listingNegotiable),
          value: draft.isNegotiable,
          onChanged: notifier.setNegotiable,
        ),
        const SizedBox(height: Insets.md),
        Text(l10n.listingHandoverMethod),
        for (final (method, label) in [
          (HandoverMethod.meetInPerson, l10n.listingHandoverMeet),
          (HandoverMethod.delivery, l10n.listingHandoverDelivery),
        ])
          _HandoverOption(
            label: label,
            selected: draft.handover == method,
            onTap: () => notifier.setHandover(method),
          ),
      ],
    );
  }
}

class _HandoverOption extends StatelessWidget {
  const _HandoverOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? palette.accent : palette.textFaint,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(label, style: context.texts.bodyMedium),
          ],
        ),
      ),
    );
  }
}
