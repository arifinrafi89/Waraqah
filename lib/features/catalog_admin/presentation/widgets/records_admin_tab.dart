import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../domain/entities/catalog_record.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_list_skeleton.dart';
import 'record_sheet.dart';
import 'record_tile.dart';

/// The Categories, Authors or Publishers tab. Categories are grouped
/// under their Section.
class RecordsAdminTab extends ConsumerWidget {
  const RecordsAdminTab(this.kind, {super.key});

  final RecordKind kind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: kind,
        onPressed: () => showRecordSheet(context, kind),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.adminCatalogAdd),
      ),
      body: AsyncView(
        value: ref.watch(adminRecordsProvider(kind)),
        skeleton: const AdminListSkeleton(),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(adminRecordsProvider(kind)),
        builder: (records) {
          Iterable<Widget> tiles(Iterable<CatalogRecord> group) => [
            for (final r in group)
              Padding(
                padding: const EdgeInsets.only(bottom: Insets.sm),
                child: RecordTile(key: ValueKey(r.id), kind: kind, record: r),
              ),
          ];
          return ListView(
            padding: const EdgeInsets.fromLTRB(
              Insets.screen,
              Insets.md,
              Insets.screen,
              96,
            ),
            children: [
              if (records.isEmpty)
                Text(l10n.adminCatalogNoRecords, textAlign: TextAlign.center),
              if (kind != RecordKind.category)
                ...tiles(records)
              else
                for (final section in Section.values)
                  if (records.any((r) => r.section == section)) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Insets.sm),
                      child: Text(
                        section.label(l10n),
                        style: context.texts.titleSmall,
                      ),
                    ),
                    ...tiles(records.where((r) => r.section == section)),
                  ],
            ],
          );
        },
      ),
    );
  }
}
