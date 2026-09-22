import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/filter_chip_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/home_providers.dart';

/// The Beneficial / Non-Beneficial curation pills that filter the home feed.
class BenefitFilterRow extends ConsumerWidget {
  const BenefitFilterRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final current = ref.watch(benefitFilterProvider);
    return FilterChipBar(
      labels: [l10n.homeAllBooks, l10n.homeBeneficial, l10n.homeNonBeneficial],
      selectedIndex: BenefitFilter.values.indexOf(current),
      onSelected: (index) => ref
          .read(benefitFilterProvider.notifier)
          .select(BenefitFilter.values[index]),
    );
  }
}
