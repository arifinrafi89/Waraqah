import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/address_providers.dart';

/// A picked place: division, district and upazila (English names; empty
/// until picked).
typedef GeoPick = ({String division, String district, String upazila});

/// Division → district → upazila. Picking a division clears the district
/// and upazila; Bangla names show in Bangla where there are any.
class GeoPickers extends ConsumerWidget {
  const GeoPickers({super.key, required this.value, required this.onChanged});

  final GeoPick value;
  final ValueChanged<GeoPick> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final bangla = Localizations.localeOf(context).languageCode == 'bn';
    return AsyncView(
      value: ref.watch(geoProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(geoProvider),
      skeleton: const Column(
        spacing: Insets.md,
        children: [ShimmerBox(height: 52), ShimmerBox(height: 52)],
      ),
      builder: (divisions) {
        final division = divisions
            .where((d) => d.name == value.division)
            .firstOrNull;
        final district = division?.districts
            .where((d) => d.name == value.district)
            .firstOrNull;
        return Column(
          spacing: Insets.md,
          children: [
            _Picker(
              label: l10n.profileDivision,
              hint: l10n.profileSelectDivision,
              value: division?.name,
              items: {
                for (final d in divisions) d.name: bangla ? d.nameBn : d.name,
              },
              onChanged: (name) =>
                  onChanged((division: name, district: '', upazila: '')),
            ),
            _Picker(
              label: l10n.profileDistrict,
              hint: l10n.profileSelectDistrict,
              value: district?.name,
              items: {
                for (final d in division?.districts ?? const [])
                  d.name: bangla ? d.nameBn : d.name,
              },
              onChanged: (name) => onChanged((
                division: value.division,
                district: name,
                upazila: '',
              )),
            ),
            _Picker(
              label: l10n.profileUpazila,
              hint: l10n.profileSelectUpazila,
              value: value.upazila,
              items: {for (final u in district?.upazilas ?? const []) u: u},
              onChanged: (name) => onChanged((
                division: value.division,
                district: value.district,
                upazila: name,
              )),
            ),
          ],
        );
      },
    );
  }
}

/// One dropdown over [items] (value → shown name). A [value] not in the
/// list shows as unpicked.
class _Picker extends StatelessWidget {
  const _Picker({
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String hint;
  final String? value;
  final Map<String, String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final picked = items.containsKey(value) ? value : null;
    return DropdownButtonFormField<String>(
      key: ValueKey('$label:$picked:${items.length}'),
      initialValue: picked,
      isExpanded: true,
      decoration: InputDecoration(labelText: label, hintText: hint),
      items: [
        for (final MapEntry(:key, :value) in items.entries)
          DropdownMenuItem(value: key, child: Text(value)),
      ],
      onChanged: items.isEmpty ? null : (v) => onChanged(v!),
    );
  }
}
