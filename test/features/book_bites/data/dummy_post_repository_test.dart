import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/book_bites/data/repositories/dummy_post_repository.dart';

void main() {
  group('DummyPostRepository', () {
    final repo = DummyPostRepository();

    test('returns enough posts to fill the Book-Bites strip', () async {
      expect((await repo.getPosts()).length, greaterThanOrEqualTo(8));
    });

    test('posts have non-empty required fields', () async {
      for (final post in await repo.getPosts()) {
        expect(post.id, isNotEmpty);
        expect(post.authorId, isNotEmpty);
        expect(post.content, isNotEmpty);
        expect(post.taggedBookIds, isNotEmpty);
      }
    });
  });
}
