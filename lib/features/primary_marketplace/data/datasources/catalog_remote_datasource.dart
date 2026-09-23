import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import '../../../../core/data/models/book_dto.dart';
import '../../../../core/domain/entities/book.dart';
import '../../domain/entities/primary_listing.dart';
import '../models/primary_listing_dto.dart';
import 'catalog_seed_data.dart';

abstract class CatalogRemoteDatasource {
  Future<List<Book>> fetchBooks({String? searchQuery, String? category});
  Future<Book?> fetchBookById(String bookId);
  Future<List<PrimaryListing>> fetchListingsForBook(String bookId);
}

class CatalogRemoteDatasourceImpl implements CatalogRemoteDatasource {
  final supa.SupabaseClient _supabase;

  CatalogRemoteDatasourceImpl(this._supabase);

  @override
  Future<List<Book>> fetchBooks({String? searchQuery, String? category}) async {
    try {
      var query = _supabase.from('books').select();
      if (searchQuery != null && searchQuery.isNotEmpty) {
        query = query.ilike('title', '%$searchQuery%');
      }
      final res = await query;
      if (res is List && res.isNotEmpty) {
        return res
            .map((item) => BookDto.fromJson(item as Map<String, dynamic>).toDomain())
            .toList();
      }
    } catch (_) {
      // Fall back to seeded Google Books data if remote table not yet populated
    }

    var books = List<Book>.from(CatalogSeedData.sampleBooks);
    if (searchQuery != null && searchQuery.isNotEmpty) {
      books = books
          .where((b) =>
              b.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              b.authors.any((a) => a.toLowerCase().contains(searchQuery.toLowerCase())))
          .toList();
    }
    if (category != null && category.isNotEmpty) {
      books = books
          .where((b) => b.categories.any((c) => c.toLowerCase() == category.toLowerCase()))
          .toList();
    }
    return books;
  }

  @override
  Future<Book?> fetchBookById(String bookId) async {
    try {
      final res = await _supabase
          .from('books')
          .select()
          .eq('id', bookId)
          .maybeSingle();
      if (res != null) {
        return BookDto.fromJson(res).toDomain();
      }
    } catch (_) {}

    return CatalogSeedData.sampleBooks
        .where((b) => b.id == bookId)
        .firstOrNull;
  }

  @override
  Future<List<PrimaryListing>> fetchListingsForBook(String bookId) async {
    try {
      final res = await _supabase
          .from('primary_listings')
          .select()
          .eq('book_id', bookId);
      if (res is List && res.isNotEmpty) {
        return res
            .map((item) => PrimaryListingDto.fromJson(item as Map<String, dynamic>).toDomain())
            .toList();
      }
    } catch (_) {}

    return CatalogSeedData.sampleListings
        .where((l) => l.bookId == bookId)
        .toList();
  }
}

