import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../../home/domain/entities/banner.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_text_field.dart';
import 'book_pick_sheet.dart';

/// What a Banner opens: a Collection, Section, Book or search, and which.
class BannerTargetField extends ConsumerWidget {
  const BannerTargetField({
    super.key,
    required this.target,
    required this.onChanged,
    this.error,
  });

  final BannerTarget target;
  final ValueChanged<BannerTarget> onChanged;
  final String? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final value = target.value;
    void set(String v) => onChanged(BannerTarget(target.kind, v));
    Widget dropdown(Map<String, String> items) => DropdownButtonFormField(
      key: ValueKey('${target.kind}:$value'),
      initialValue: items.containsKey(value) ? value : null,
      isExpanded: true,
      decoration: adminInputDecoration(
        context,
        l10n.adminCatalogPick,
        error: error,
      ),
      items: [
        for (final MapEntry(:key, :value) in items.entries)
          DropdownMenuItem(value: key, child: Text(value)),
      ],
      onChanged: (v) => set(v ?? ''),
    );
    final books = ref.watch(adminBooksProvider).value ?? const <Book>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        DropdownButtonFormField<BannerTargetKind>(
          initialValue: target.kind,
          isExpanded: true,
          decoration: adminInputDecoration(
            context,
            l10n.adminCatalogBannerOpens,
          ),
          items: [
            for (final kind in BannerTargetKind.values)
              DropdownMenuItem(
                value: kind,
                child: Text(_kindLabel(l10n, kind)),
              ),
          ],
          onChanged: (kind) => onChanged(BannerTarget(kind!, '')),
        ),
        switch (target.kind) {
          BannerTargetKind.collection => dropdown({
            for (final c
                in ref.watch(collectionsProvider(null)).value ?? const [])
              c.id: c.title(isBangla),
          }),
          BannerTargetKind.section => dropdown({
            for (final s in Section.values) s.name: s.label(l10n),
          }),
          BannerTargetKind.book => InkWell(
            onTap: () async {
              final id = await showBookPicker(context);
              if (id != null) set(id);
            },
            child: InputDecorator(
              decoration: adminInputDecoration(
                context,
                l10n.adminCatalogTargetBook,
                error: error,
              ),
              child: Text(
                books.where((b) => b.id == value).firstOrNull?.title ??
                    l10n.adminCatalogPick,
              ),
            ),
          ),
          BannerTargetKind.search => AdminTextField(
            key: const ValueKey('search-words'),
            label: l10n.adminCatalogSearchWords,
            initialValue: value,
            error: error,
            onChanged: set,
          ),
        },
      ],
    );
  }

  static String _kindLabel(AppL10n l10n, BannerTargetKind kind) =>
      switch (kind) {
        BannerTargetKind.collection => l10n.adminCatalogTargetCollection,
        BannerTargetKind.section => l10n.adminCatalogFieldSection,
        BannerTargetKind.book => l10n.adminCatalogTargetBook,
        BannerTargetKind.search => l10n.adminCatalogTargetSearch,
      };
}
