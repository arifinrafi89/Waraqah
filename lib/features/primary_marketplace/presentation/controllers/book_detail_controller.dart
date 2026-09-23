import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/book.dart';
import '../../data/repositories/catalog_repository_impl.dart';
import '../../domain/entities/primary_listing.dart';

class BookDetailState {
  final Book? book;
  final List<PrimaryListing> listings;
  final PrimaryListing? selectedListing;
  final bool isLoading;
  final String? error;

  const BookDetailState({
    this.book,
    this.listings = const [],
    this.selectedListing,
    this.isLoading = false,
    this.error,
  });

  BookDetailState copyWith({
    Book? book,
    List<PrimaryListing>? listings,
    PrimaryListing? selectedListing,
    bool? isLoading,
    String? error,
  }) {
    return BookDetailState(
      book: book ?? this.book,
      listings: listings ?? this.listings,
      selectedListing: selectedListing ?? this.selectedListing,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

final bookDetailControllerProvider = AutoDisposeStateNotifierProvider.family<
    BookDetailController, BookDetailState, String>((ref, bookId) {
  return BookDetailController(ref, bookId);
});

class BookDetailController extends StateNotifier<BookDetailState> {
  final Ref _ref;
  final String _bookId;

  BookDetailController(this._ref, this._bookId)
      : super(const BookDetailState(isLoading: true)) {
    _loadBookDetails();
  }

  Future<void> _loadBookDetails() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = _ref.read(catalogRepositoryProvider);
      final book = await repository.getBookById(_bookId);
      final listings = await repository.getListingsForBook(_bookId);

      // Select cheapest listing by default
      PrimaryListing? initialSelected;
      if (listings.isNotEmpty) {
        initialSelected = listings.reduce(
          (a, b) => a.priceAmount < b.priceAmount ? a : b,
        );
      }

      state = state.copyWith(
        book: book,
        listings: listings,
        selectedListing: initialSelected,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void selectListing(PrimaryListing listing) {
    state = state.copyWith(selectedListing: listing);
  }
}

