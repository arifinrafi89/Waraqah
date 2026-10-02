import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../domain/usecases/get_tag_book.dart';
import '../../domain/usecases/search_tag_books.dart';

final searchTagBooksProvider = Provider(
  (ref) => SearchTagBooks(ref.watch(bookRepositoryProvider)),
);

/// A Book to tag by id, for the composer and quote cards.
final tagBookProvider = FutureProvider.autoDispose.family<Book?, String>(
  (ref, id) => GetTagBook(ref.watch(bookRepositoryProvider))(id),
);

/// Spoilers the Reader tapped open this session, by Bite id.
class RevealedSpoilers extends Notifier<Set<String>> {
  @override
  Set<String> build() => const {};

  void reveal(String id) => state = {...state, id};
}

final revealedSpoilersProvider =
    NotifierProvider<RevealedSpoilers, Set<String>>(RevealedSpoilers.new);
