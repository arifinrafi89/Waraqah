import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../../data/repositories/catalog_admin_repository_impl.dart';
import '../../data/sources/catalog_admin_remote_source.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/repositories/catalog_admin_repository.dart';
import '../../domain/usecases/get_admin_books.dart';
import '../../domain/usecases/get_admin_records.dart';

final catalogAdminRepositoryProvider = Provider<CatalogAdminRepository>(
  (ref) => CatalogAdminRepositoryImpl(
    CatalogAdminRemoteSource(ref.watch(dioProvider)),
  ),
);

/// Every Book, hidden ones too, newest first.
final adminBooksProvider = FutureProvider<List<Book>>(
  (ref) => GetAdminBooks(ref.watch(bookRepositoryProvider))(const NoParams()),
);

/// Every Category, Author or Publisher, with how many Books use it.
final adminRecordsProvider =
    FutureProvider.family<List<CatalogRecord>, RecordKind>(
      (ref, kind) =>
          GetAdminRecords(ref.watch(catalogAdminRepositoryProvider))(kind),
    );

/// The Books tab's search text, matched against title and Author.
final adminBookQueryProvider = selectionProvider<String>('');

/// Whether the Books tab lists hidden Books too.
final adminShowHiddenProvider = selectionProvider<bool>(false);

/// After any change: drop every cache that holds the catalog or Banners,
/// so Home, Search, Section pages and this area read it again.
void refreshCatalog(Ref ref) => ref
  ..invalidate(bookRepositoryProvider)
  ..invalidate(catalogRecordsRepositoryProvider)
  ..invalidate(getBannersProvider)
  ..invalidate(adminRecordsProvider);
