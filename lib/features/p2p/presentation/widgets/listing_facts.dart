import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_labels.dart';

/// The short facts about a copy as chips: status, condition, whether the
/// price is negotiable, how the seller likes to hand over, where, and the
/// catalog Category (or its Section until the Categories load).
class ListingFacts extends ConsumerWidget {
  const ListingFacts({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final section = listing.section;
    final category = section == null
        ? null
        : ref
              .watch(sectionCategoriesProvider(section))
              .value
              ?.where((c) => c.id == listing.categoryId)
              .firstOrNull;
    final bangla = Localizations.localeOf(context).languageCode == 'bn';
    return Wrap(
      spacing: Insets.sm,
      runSpacing: Insets.sm,
      children: [
        _Fact(
          listing.isMine
              ? l10n.listingStatus(listing.status)
              : l10n.marketStatus(listing.status),
          strong: listing.isAvailable,
        ),
        _Fact(l10n.conditionLabel(listing.condition)),
        _Fact(listing.isNegotiable ? l10n.usedNegotiable : l10n.usedFixedPrice),
        _Fact(l10n.handoverPreference(listing.handover)),
        if (listing.place.isNotEmpty) _Fact(listing.place),
        if (category != null)
          _Fact(bangla ? category.nameBn : category.nameEn)
        else if (section != null)
          _Fact(section.label(l10n)),
      ],
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact(this.label, {this.strong = false});

  final String label;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: strong ? palette.accentSoft : palette.surface2,
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Text(
        label,
        style: AppFonts.ui(
          size: 11.5,
          weight: FontWeight.w700,
          color: strong ? palette.accent : palette.textDim,
        ),
      ),
    );
  }
}
