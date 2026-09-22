import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/data/dummy_book_repository.dart';
import 'package:waraqah/core/data/dummy_profile_repository.dart';

void main() {
  group('DummyBookRepository', () {
    final repo = DummyBookRepository();

    test('returns enough books to fill a grid', () async {
      expect((await repo.getBooks()).length, greaterThanOrEqualTo(8));
    });

    test('books have non-empty required fields', () async {
      for (final book in await repo.getBooks()) {
        expect(book.id, isNotEmpty);
        expect(book.title, isNotEmpty);
        expect(book.author, isNotEmpty);
        expect(book.isbn, isNotEmpty);
        expect(book.genre, isNotEmpty);
        expect(book.coverUrl, isNotEmpty);
        expect(book.currency, isNotEmpty);
        expect(book.price, greaterThan(0));
        expect(book.vendorName, isNotEmpty);
      }
    });
  });

  group('DummyProfileRepository', () {
    final repo = DummyProfileRepository();

    test('returns non-empty profiles', () async {
      expect(await repo.getProfiles(), isNotEmpty);
    });

    test('profiles have non-empty required fields', () async {
      for (final profile in await repo.getProfiles()) {
        expect(profile.id, isNotEmpty);
        expect(profile.fullName, isNotEmpty);
        expect(profile.university, isNotEmpty);
        expect(profile.studentId, isNotEmpty);
        expect(profile.avatarUrl, isNotEmpty);
      }
    });
  });
}
