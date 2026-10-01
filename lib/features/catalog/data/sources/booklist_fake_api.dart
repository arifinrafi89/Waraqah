import 'package:dio/dio.dart';

import '../../domain/entities/booklist.dart';
import '../models/booklist_model.dart';
import 'book_fixtures.dart';
import 'booklist_fixtures.dart';

/// Booklists' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Each comes with its `books`, hidden ones
/// left out. `isMine` marks the one fake Reader's own lists.
abstract final class BooklistFakeApi {
  /// Every Staff Booklist and the Reader's own.
  static const String booklists = '/booklists';

  /// One Booklist: `?id=`, or `null` when unknown.
  static const String detail = '/booklists/detail';

  /// Body `{id?, name?, bookIds?}`: no `id` makes a new own list (`name`
  /// needed); with an `id`, renames it and/or replaces its books. Answers
  /// the list, or `null` when refused.
  static const String saveMine = '/booklists/mine/save';

  /// Body `{id}` → `{id}`, or `null` when it isn't the Reader's own.
  static const String deleteMine = '/booklists/mine/delete';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    booklists: (_) => [for (final b in BooklistFixtures.all) json(b)],
    detail: (o) {
      final id = o.queryParameters['id'] as String?;
      final found = BooklistFixtures.all.where((b) => b.id == id);
      return found.isEmpty ? null : json(found.first);
    },
    saveMine: (o) => _saveMine(_body(o)),
    deleteMine: (o) {
      final id = _body(o)['id'];
      final before = BooklistFixtures.all.length;
      BooklistFixtures.all.removeWhere((b) => b.id == id && b.isMine);
      return BooklistFixtures.all.length < before ? {'id': id} : null;
    },
  };

  static Map<String, dynamic>? _saveMine(Map<String, dynamic> body) {
    final id = body['id'] as String?;
    final name = (body['name'] as String?)?.trim();
    final bookIds = (body['bookIds'] as List<dynamic>?)?.cast<String>();
    final i = BooklistFixtures.all.indexWhere((b) => b.id == id && b.isMine);
    if ((id != null && i < 0) ||
        (name != null && name.isEmpty) ||
        (id == null && name == null) ||
        (bookIds != null &&
            (bookIds.toSet().length < bookIds.length ||
                !bookIds.every(
                  (b) => BookFixtures.all.any((x) => x.id == b),
                )))) {
      return null;
    }
    final old = i < 0
        ? BooklistModel(
            id: 'bl-mine-${DateTime.now().microsecondsSinceEpoch}',
            titleEn: name!,
            titleBn: name,
            kind: BooklistKind.personal,
            bookIds: const [],
            isMine: true,
          )
        : BooklistFixtures.all[i];
    final saved = old.copyWith(
      titleEn: name ?? old.titleEn,
      titleBn: name ?? old.titleBn,
      bookIds: bookIds ?? old.bookIds,
    );
    i < 0 ? BooklistFixtures.all.add(saved) : BooklistFixtures.all[i] = saved;
    return json(saved);
  }

  /// [list] with its `books`, hidden ones left out.
  static Map<String, dynamic> json(BooklistModel list) => {
    ...list.toJson(),
    'books': [
      for (final id in list.bookIds)
        ...BookFixtures.all
            .where((b) => b.id == id && !b.hidden)
            .map((b) => b.toJson()),
    ],
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
