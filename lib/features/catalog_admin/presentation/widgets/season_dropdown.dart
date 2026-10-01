import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../home/domain/entities/season.dart';
import '../../../home/presentation/widgets/season_labels.dart';
import '../providers/catalog_admin_actions.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_text_field.dart';

/// Picks a [Season] or none: [noneLabel] names the `null` choice.
class SeasonDropdown extends StatelessWidget {
  const SeasonDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.noneLabel,
    required this.onChanged,
  });

  final Season? value;
  final String label;
  final String noneLabel;
  final ValueChanged<Season?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return DropdownButtonFormField<Season?>(
      key: ValueKey(value),
      initialValue: value,
      isExpanded: true,
      decoration: adminInputDecoration(context, label),
      items: [
        DropdownMenuItem(child: Text(noneLabel)),
        for (final s in Season.values)
          DropdownMenuItem(value: s, child: Text(l10n.season(s))),
      ],
      onChanged: onChanged,
    );
  }
}

/// The Banners tab's top row: force a Season on Home, or leave it to the
/// date. Home changes at once.
class SeasonOverrideDropdown extends ConsumerWidget {
  const SeasonOverrideDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final current = ref.watch(seasonOverrideProvider);
    if (!current.hasValue) return const SizedBox.shrink();
    return SeasonDropdown(
      value: current.value,
      label: l10n.adminCatalogSeasonHome,
      noneLabel: l10n.adminCatalogSeasonAuto,
      onChanged: ref.read(catalogAdminActionsProvider).setSeason,
    );
  }
}
