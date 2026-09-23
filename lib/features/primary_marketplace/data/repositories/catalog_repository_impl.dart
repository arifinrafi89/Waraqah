import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/book.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/supabase_client.dart';
import '../../domain/entities/primary_listing.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../datasources/catalog_remote_datasource.dart';

final catalogRemoteDatasourceProvider =
    Provider<CatalogRemoteDatasource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return CatalogRemoteDatasourceImpl(supabase);
});

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final remoteDatasource = ref.watch(catalogRemoteDatasourceProvider);
  return CatalogRepositoryImpl(remoteDatasource);
});

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogRemoteDatasource _remoteDatasource;

  CatalogRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Book>> getBooks({String? searchQuery, String? category}) async {
    try {
      final books = await _remoteDatasource.fetchBooks(
        searchQuery: searchQuery,
        category: category,
      );

      // Fetch lowest edition price per book for sorting (REQ-3.1.5 & REQ-3.1.6)
      final booksWithMinPrice = <Book, double>{};
      for (final book in books) {
        final listings = await _remoteDatasource.fetchListingsForBook(book.id);
        if (listings.isNotEmpty) {
          final minPrice = listings
              .map((l) => l.priceAmount)
              .reduce((a, b) => a < b ? a : b);
          booksWithMinPrice[book] = minPrice;
        } else {
          booksWithMinPrice[book] = double.infinity;
        }
      }

      // Sort: cheapest -> most expensive, tie-break by averageRating descending
      books.sort((a, b) {
        final priceA = booksWithMinPrice[a] ?? double.infinity;
        final priceB = booksWithMinPrice[b] ?? double.infinity;
        final priceComparison = priceA.compareTo(priceB);

        if (priceComparison != 0) {
          return priceComparison;
        }

        // Tie-break: averageRating descending
        final ratingA = a.averageRating ?? 0.0;
        final ratingB = b.averageRating ?? 0.0;
        final ratingComparison = ratingB.compareTo(ratingA);

        if (ratingComparison != 0) {
          return ratingComparison;
        }

        // Secondary tie-break: ratingsCount descending
        final countA = a.ratingsCount ?? 0;
        final countB = b.ratingsCount ?? 0;
        return countB.compareTo(countA);
      });

      return books;
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<Book?> getBookById(String bookId) async {
    try {
      return await _remoteDatasource.fetchBookById(bookId);
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<PrimaryListing>> getListingsForBook(String bookId) async {
    try {
      return await _remoteDatasource.fetchListingsForBook(bookId);
    } on AppException catch (e) {
      throw ServerFailure(e.message, e.statusCode);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}

