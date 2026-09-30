import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../catalog_routes.dart';
import '../providers/catalog_providers.dart';

/// A scrolling row of a Section's Categories. Each opens its Category page.
/// Shows nothing while loading, on error, or when the Section has none.
class CategoryChips extends ConsumerWidget {
  const CategoryChips({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(sectionCategoriesProvider(section)).value;
    if (categories == null || categories.isEmpty) return const SizedBox();
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: Insets.sm),
        itemBuilder: (_, i) => ActionChip(
          label: Text(isBangla ? categories[i].nameBn : categories[i].nameEn),
          onPressed: () => context.push(
            CatalogRoutes.categoryFor(section, categories[i].id),
          ),
        ),
      ),
    );
  }
}
