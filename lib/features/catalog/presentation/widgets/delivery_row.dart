import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/delivery_area.dart';
import '../../domain/entities/delivery_estimate.dart';
import '../providers/edition_providers.dart';
import 'edition_labels.dart';

/// "Arrives in 1–2 days · Deliver to Inside Dhaka", with a way to change the
/// area. eBooks skip the area, since they download straight away.
class DeliveryRow extends ConsumerWidget {
  const DeliveryRow({super.key, required this.edition});

  final Edition edition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final area = ref.watch(deliveryAreaProvider);
    final estimate = DeliveryEstimate.of(edition, area);
    final isEbook = edition.format == BookFormat.ebook;
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(Insets.md, 10, Insets.sm, 10),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(
            isEbook ? Icons.download_rounded : Icons.local_shipping_outlined,
            size: 20,
            color: palette.accent,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.deliveryLabel(estimate),
                  style: context.texts.titleSmall,
                ),
                if (!isEbook)
                  Text(
                    l10n.bookDeliverTo(l10n.areaLabel(area)),
                    style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                  ),
              ],
            ),
          ),
          if (!isEbook)
            TextButton(
              onPressed: () => _pickArea(context, ref),
              child: Text(l10n.bookChangeArea),
            ),
        ],
      ),
    );
  }

  Future<void> _pickArea(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final current = ref.read(deliveryAreaProvider);
    final picked = await showModalBottomSheet<DeliveryArea>(
      context: context,
      showDragHandle: true,
      builder: (sheet) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.bookChooseArea, style: sheet.texts.titleMedium),
            const SizedBox(height: Insets.sm),
            for (final area in DeliveryArea.values)
              ListTile(
                title: Text(l10n.areaLabel(area)),
                trailing: area == current
                    ? const Icon(Icons.check_rounded)
                    : null,
                onTap: () => Navigator.pop(sheet, area),
              ),
            const SizedBox(height: Insets.sm),
          ],
        ),
      ),
    );
    if (picked != null) ref.read(deliveryAreaProvider.notifier).select(picked);
  }
}
