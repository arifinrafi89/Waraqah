import 'package:dio/dio.dart';

import 'bite_comments.dart';
import 'bite_fake_json.dart';
import 'bite_fake_store.dart';

/// Bites' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. A refused change answers `null`.
abstract final class BiteFakeApi {
  /// `?feed=forYou|following&bookId=&authorId=`: newest first, at most 30.
  static const String feed = '/bites';

  /// `?id=`: one Bite with its comments.
  static const String detail = '/bites/detail';

  /// Body `{text, bookId?, spoiler}`: answers the Bite.
  static const String post = '/bites/post';

  /// Body `{id, text, bookId?, spoiler}`: own only; answers the Bite.
  static const String edit = '/bites/edit';

  /// Body `{id}`: own only; answers `{id}`.
  static const String delete = '/bites/delete';

  /// Body `{id, liked}`: answers the Bite.
  static const String like = '/bites/like';

  /// Body `{biteId, text, parentId?}`: answers the detail.
  static const String comment = '/bites/comments/post';

  /// Body `{id}`: own only; answers the detail.
  static const String deleteComment = '/bites/comments/delete';

  static Map<String, Object? Function(RequestOptions)> routes(
    BiteFakeStore store,
  ) {
    Map<String, dynamic>? detailOf(String? biteId) =>
        switch (store.find(biteId ?? '')) {
          final b? => store.detailJson(b),
          null => null,
        };
    return {
      feed: (o) {
        final q = o.queryParameters;
        return [
          for (final b in store.feed(
            following: q['feed'] == 'following',
            bookId: q['bookId'] as String?,
            authorId: q['authorId'] as String?,
          ))
            store.biteJson(b),
        ];
      },
      detail: (o) => detailOf(o.queryParameters['id'] as String?),
      post: (o) {
        final b = _body(o);
        final bite = store.post(
          b['text'] as String? ?? '',
          b['bookId'] as String?,
          spoiler: b['spoiler'] == true,
        );
        return bite == null ? null : store.biteJson(bite);
      },
      edit: (o) {
        final b = _body(o);
        final bite = store.edit(
          b['id'] as String? ?? '',
          b['text'] as String? ?? '',
          b['bookId'] as String?,
          b['spoiler'] == true,
        );
        return bite == null ? null : store.biteJson(bite);
      },
      delete: (o) {
        final id = _body(o)['id'] as String? ?? '';
        return store.delete(id) ? {'id': id} : null;
      },
      like: (o) {
        final b = _body(o);
        final bite = store.like(
          b['id'] as String? ?? '',
          liked: b['liked'] == true,
        );
        return bite == null ? null : store.biteJson(bite);
      },
      comment: (o) {
        final b = _body(o);
        final c = store.comment(
          b['biteId'] as String? ?? '',
          b['text'] as String? ?? '',
          parentId: b['parentId'] as String?,
        );
        return c == null ? null : detailOf(c.biteId);
      },
      deleteComment: (o) {
        final id = _body(o)['id'] as String? ?? '';
        final biteId = store.findComment(id)?.biteId;
        return store.deleteComment(id) ? detailOf(biteId) : null;
      },
    };
  }

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
