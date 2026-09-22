import '../entities/bite.dart';

/// The Book-Bites block's contract. Home shows the first page of this feed.
abstract interface class BiteRepository {
  Future<List<Bite>> fetchFeed({int limit = 10});
}
