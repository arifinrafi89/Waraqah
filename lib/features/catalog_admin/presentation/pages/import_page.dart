import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/entities/csv_import.dart';
import '../../domain/entities/import_book.dart';
import '../providers/catalog_admin_actions.dart';
import '../providers/catalog_admin_providers.dart';
import '../widgets/admin_page_bar.dart';
import '../widgets/import_form.dart';
import '../widgets/import_preview.dart';

/// `/admin/catalog/import`: paste CSV rows, Check them, then Import the
/// Books that pass. No file picker: Staff paste from a spreadsheet.
class ImportPage extends ConsumerStatefulWidget {
  const ImportPage({super.key});

  @override
  ConsumerState<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends ConsumerState<ImportPage> {
  final _csv = TextEditingController();
  ImportPlan? _plan;
  var _busy = false;

  @override
  void dispose() {
    _csv.dispose();
    super.dispose();
  }

  Future<void> _check() async {
    Future<List<CatalogRecord>> records(RecordKind kind) =>
        ref.read(adminRecordsProvider(kind).future);
    final books = await ref.read(adminBooksProvider.future);
    final plan = CsvImport.parse(
      _csv.text,
      categories: await records(RecordKind.category),
      authors: await records(RecordKind.author),
      publishers: await records(RecordKind.publisher),
      takenIsbns: {
        for (final b in books) ...b.editions.map((e) => e.isbn).nonNulls,
      },
    );
    if (mounted) setState(() => _plan = plan);
  }

  Future<void> _import(List<ImportBook> books) async {
    setState(() => _busy = true);
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final done = await ref.read(catalogAdminActionsProvider).importBooks(books);
    messenger.showSnackBar(
      SnackBar(
        content: Text(l10n.adminCatalogImportDone(done.imported, done.skipped)),
      ),
    );
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final books = _plan?.books ?? const [];
    return Scaffold(
      bottomNavigationBar: books.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Insets.screen),
                child: PrimaryButton(
                  label: l10n.adminCatalogImportBooks(books.length),
                  isBusy: _busy,
                  onPressed: _busy ? null : () => _import(books),
                ),
              ),
            ),
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              AdminPageBar(title: l10n.adminCatalogImport),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(Insets.screen),
                  children: [
                    ImportForm(
                      csv: _csv,
                      onChanged: () => setState(() => _plan = null),
                      onCheck: _check,
                    ),
                    const SizedBox(height: Insets.lg),
                    if (_plan case final plan?) ImportPreview(plan: plan),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
