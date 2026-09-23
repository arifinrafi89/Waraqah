import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/book.dart';
import '../../data/repositories/catalog_repository_impl.dart';
import '../../domain/entities/primary_listing.dart';
import '../../domain/repositories/catalog_repository.dart';

final catalogSearchQueryProvider = StateProvider<String>((ref) => '');
final catalogCategoryProvider = StateProvider<String?>((ref) => null);

final catalogControllerProvider =
    AutoDisposeAsyncNotifierProvider<CatalogController, List<Book>>(() {
  return CatalogController();
});

final bookListingsProvider =
    FutureProvider.family<List<PrimaryListing>, String>((ref, bookId) async {
  final repository = ref.watch(catalogRepositoryProvider);
  return await repository.getListingsForBook(bookId);
});

final bookMinPriceProvider =
    Provider.family<double?, String>((ref, bookId) {
  final listingsAsync = ref.watch(bookListingsProvider(bookId));
  return listingsAsync.maybeWhen(
    data: (listings) {
      if (listings.isEmpty) return null;
      return listings.map((l) => l.priceAmount).reduce((a, b) => a < b ? a : b);
    },
    orElse: () => null,
  );
});

class CatalogController extends AutoDisposeAsyncNotifier<List<Book>> {
  late final CatalogRepository _repository;

  @override
  Future<List<Book>> build() async {
    _repository = ref.watch(catalogRepositoryProvider);
    final search = ref.watch(catalogSearchQueryProvider);
    final category = ref.watch(catalogCategoryProvider);

    return await _repository.getBooks(
      searchQuery: search.isEmpty ? null : search,
      category: category,
    );
  }

  void updateSearchQuery(String query) {
    ref.read(catalogSearchQueryProvider.notifier).state = query;
  }

  void selectCategory(String? category) {
    ref.read(catalogCategoryProvider.notifier).state = category;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}

