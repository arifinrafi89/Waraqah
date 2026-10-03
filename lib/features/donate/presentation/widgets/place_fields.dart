import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/presentation/providers/address_providers.dart';
import '../../domain/entities/recipient.dart';
import '../providers/donate_admin_providers.dart';

/// The place's name, kind, district (from `/geo`), area and story.
class PlaceFields extends ConsumerWidget {
  const PlaceFields({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final bangla = Localizations.localeOf(context).languageCode == 'bn';
    final draft = ref.watch(placeDraftProvider(id)).requireValue;
    final notifier = ref.read(placeDraftProvider(id).notifier);
    final districts = [
      for (final division in ref.watch(geoProvider).value ?? const [])
        ...division.districts,
    ]..sort((a, b) => a.name.compareTo(b.name));
    InputDecoration label(String text, [String? hint]) =>
        InputDecoration(labelText: text, hintText: hint);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.md,
      children: [
        TextFormField(
          initialValue: draft.name,
          decoration: label(l10n.adminDonateName),
          onChanged: (v) => notifier.edit((d) => d.copyWith(name: v)),
        ),
        Text(l10n.adminDonateKind),
        Wrap(
          spacing: Insets.sm,
          children: [
            for (final kind in RecipientKind.values)
              ChoiceChip(
                label: Text(l10n.giftDonateKind(kind.name)),
                selected: draft.kind == kind,
                onSelected: (_) => notifier.edit((d) => d.copyWith(kind: kind)),
              ),
          ],
        ),
        DropdownButtonFormField<String>(
          // Rebuilt once `/geo` arrives, so a saved district shows.
          key: ValueKey(districts.length),
          initialValue: districts.any((d) => d.name == draft.district)
              ? draft.district
              : null,
          isExpanded: true,
          decoration: label(l10n.adminDonateDistrict),
          items: [
            for (final d in districts)
              DropdownMenuItem(
                value: d.name,
                child: Text(bangla ? d.nameBn : d.name),
              ),
          ],
          onChanged: (v) => notifier.edit((d) => d.copyWith(district: v ?? '')),
        ),
        TextFormField(
          initialValue: draft.area,
          decoration: label(l10n.adminDonateArea),
          onChanged: (v) => notifier.edit((d) => d.copyWith(area: v)),
        ),
        TextFormField(
          initialValue: draft.story,
          minLines: 2,
          maxLines: 4,
          decoration: label(l10n.adminDonateStory, l10n.adminDonateStoryHint),
          onChanged: (v) => notifier.edit((d) => d.copyWith(story: v)),
        ),
      ],
    );
  }
}
