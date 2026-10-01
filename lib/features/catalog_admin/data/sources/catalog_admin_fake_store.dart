// Edits the catalog's and Home's fixture lists in place, for every reader.
import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../catalog/data/sources/author_fixtures.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/booklist_fixtures.dart';
import '../../../catalog/data/sources/category_fixtures.dart';
import '../../../catalog/data/sources/collection_fixtures.dart';
import '../../../catalog/data/sources/publisher_fixtures.dart';
import '../../../home/data/sources/banner_fixtures.dart';
import '../../../home/domain/entities/season.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../models/book_draft_json.dart';

/// Staff's Book changes on the fake backend. A new one resets every seed.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
class CatalogAdminFakeStore {
  CatalogAdminFakeStore() {
    BookFixtures.reset();
    CategoryFixtures.reset();
    AuthorFixtures.reset();
    PublisherFixtures.reset();
    CollectionFixtures.reset();
    BooklistFixtures.reset();
    BannerFixtures.reset();
  }

  /// The Season Staff forced on Home; `null` = picked by date.
  Season? seasonOverride;

  static const _formatCodes = {
    BookFormat.paperback: 'pb',
    BookFormat.hardcover: 'hc',
    BookFormat.ebook: 'eb',
  };
  static const _languageCodes = {
    BookLanguage.english: 'en',
    BookLanguage.bangla: 'bn',
    BookLanguage.arabic: 'ar',
  };

  /// Adds or updates a Book from a `BookDraft` body; `null` when refused.
  Book? saveBook(Map<String, dynamic> json) {
    final draft = BookDraftJson.fromJson(json);
    final old = BookFixtures.all.where((b) => b.id == draft.id).firstOrNull;
    final author = AuthorFixtures.all
        .where((a) => a.id == draft.authorId)
        .firstOrNull;
    final category = CategoryFixtures.all
        .where((c) => c.id == draft.categoryId)
        .firstOrNull;
    final id =
        old?.id ??
        uniqueId('bk', draft.title, BookFixtures.all.map((b) => b.id));
    final takenIsbns = {
      for (final b in BookFixtures.all)
        if (b.id != id) ...b.editions.map((e) => e.isbn).nonNulls,
    };
    final problems = CatalogAdminRules.wholeBook(
      draft,
      categorySection: category?.section,
      takenIsbns: takenIsbns,
    );
    if ((draft.id != null && old == null) ||
        author == null ||
        !PublisherFixtures.all.any((p) => p.id == draft.publisherId) ||
        problems.isNotEmpty) {
      return null;
    }
    final title = draft.title.trim();
    final book = Book(
      id: id,
      title: title,
      titleBn: draft.titleBn.trim().isEmpty ? null : draft.titleBn.trim(),
      shortTitle: old?.title == title ? old?.shortTitle : null,
      author: author.name,
      authorId: author.id,
      publisherId: draft.publisherId,
      categoryId: draft.categoryId,
      section: draft.section,
      originalLanguage: draft.originalLanguage,
      coverSeed: draft.coverSeed,
      addedAt: old?.addedAt ?? DateTime.now(),
      rating: old?.rating ?? 0,
      tags: old?.tags ?? const [],
      hidden: old?.hidden ?? false,
      editions: [
        for (final e in draft.editions)
          CatalogAdminRules.tidy(e).copyWith(
            id: '$id-${_formatCodes[e.format]}-${_languageCodes[e.language]}',
          ),
      ],
    );
    final i = BookFixtures.all.indexWhere((b) => b.id == id);
    i < 0 ? BookFixtures.all.add(book) : BookFixtures.all[i] = book;
    return book;
  }

  /// Hides or unhides a Book; `null` when unknown.
  Book? setHidden(String id, {required bool hidden}) {
    final i = BookFixtures.all.indexWhere((b) => b.id == id);
    if (i < 0) return null;
    return BookFixtures.all[i] = BookFixtures.all[i].copyWith(hidden: hidden);
  }

  /// `<prefix>-<slug of text>`, with `-2`, `-3`… when [taken] has it.
  static String uniqueId(String prefix, String text, Iterable<String> taken) {
    final slug = text
        .toLowerCase()
        .replaceAll(RegExp('[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
    final base = '$prefix-${slug.isEmpty ? 'new' : slug}';
    final used = taken.toSet();
    var id = base;
    for (var n = 2; used.contains(id); n++) {
      id = '$base-$n';
    }
    return id;
  }
}
