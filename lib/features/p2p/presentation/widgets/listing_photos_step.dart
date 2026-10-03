import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/listing_rules.dart';
import '../providers/listing_photo_picker.dart';
import '../providers/p2p_add_listing_notifier.dart';
import 'listing_photo_tile.dart';
import 'p2p_labels.dart';

/// Step 3: one photo per slot (front, back, spine, inside, damage), each
/// tapped to pick or removed with its ✕.
class ListingPhotosStep extends ConsumerWidget {
  const ListingPhotosStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final draft = ref.watch(p2pAddListingProvider);
    final notifier = ref.read(p2pAddListingProvider.notifier);
    Future<void> pick(String slot) async {
      final bytes = await ref.read(listingPhotoPickerProvider)();
      if (bytes != null) notifier.setPhoto(slot, bytes);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.md,
      children: [
        Text(
          l10n.listingPhotosHelp,
          style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
        ),
        GridView.extent(
          maxCrossAxisExtent: 110,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: Insets.sm,
          crossAxisSpacing: Insets.sm,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (final slot in ListingRules.photoSlots)
              ListingPhotoTile(
                label: l10n.photoSlot(slot),
                bytes: notifier.photoBytes[slot],
                held: draft.photos.contains(slot),
                needed: ListingRules.needsPhoto(draft, slot),
                onPick: () => pick(slot),
                onRemove: () => notifier.removePhoto(slot),
              ),
          ],
        ),
      ],
    );
  }
}
