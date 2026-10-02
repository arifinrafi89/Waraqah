import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/edition.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/entities/isbn_lookup.dart';
import '../providers/book_form_provider.dart';
import '../providers/catalog_admin_providers.dart';
import 'record_sheet.dart';

/// Fills the Add book form from [found]: titles, Author, Publisher, and a
/// first Edition priced at the list price. An unknown Author or Publisher
/// opens "Add new" with its name filled in.
Future<void> fillFromIsbn(
  BuildContext context,
  WidgetRef ref,
  IsbnFound found,
) async {
  final authorId = await _recordId(
    context,
    ref,
    RecordKind.author,
    found.author,
  );
  if (!context.mounted) return;
  final publisherId = await _recordId(
    context,
    ref,
    RecordKind.publisher,
    found.publisher,
  );
  final edition = Edition(
    id: '',
    format: found.format,
    language: found.language,
    isbn: found.isbn,
    priceBdt: found.listPriceBdt ?? 0,
    stock: 0,
  );
  await ref
      .read(bookFormProvider(null).notifier)
      .edit(
        (d) => d.copyWith(
          title: found.title,
          titleBn: found.titleBn ?? '',
          authorId: authorId,
          publisherId: publisherId,
          originalLanguage: found.language,
          editions: [edition],
        ),
      );
}

/// The id of the record called [name], or of the one Staff add for it; ''
/// when they don't.
Future<String> _recordId(
  BuildContext context,
  WidgetRef ref,
  RecordKind kind,
  String name,
) async {
  final records = await ref.read(adminRecordsProvider(kind).future);
  final known = records.where((r) => r.isNamed(name)).firstOrNull;
  if (known != null || !context.mounted) return known?.id ?? '';
  final added = await showRecordSheet(context, kind, CatalogRecord(name: name));
  return added?.id ?? '';
}
