// The tagged Book's title comes from the catalog; names and areas from the
// marketplace's readers.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../models/bite_model.dart';
import 'bite_fake_store.dart';
import 'bite_records.dart';

/// What the server answers about Bites, as seen by "me".
extension BiteFakeJson on BiteFakeStore {
  Map<String, dynamic> biteJson(BiteRecord b) {
    final author = P2pPeople.find(b.authorId);
    return BiteModel(
      id: b.id,
      authorId: b.authorId,
      authorName: author?.name ?? '?',
      authorArea: author?.area ?? '',
      text: b.text,
      createdAt: b.createdAt,
      editedAt: b.editedAt,
      bookId: b.bookId,
      bookTitle: BookFixtures.all
          .where((book) => book.id == b.bookId)
          .firstOrNull
          ?.title,
      spoiler: b.spoiler,
      likes: b.likedBy.length,
      liked: b.likedBy.contains(P2pPeople.me),
      comments: comments.where((c) => c.biteId == b.id).length,
      isMine: b.authorId == P2pPeople.me,
    ).toJson();
  }

  /// The Bite with its top comments, each carrying its replies.
  Map<String, dynamic> detailJson(BiteRecord b) {
    final on = comments.where((c) => c.biteId == b.id);
    return {
      'bite': biteJson(b),
      'comments': [
        for (final top in on.where((c) => c.parentId == null))
          _comment(top, [
            for (final reply in on.where((c) => c.parentId == top.id))
              _comment(reply),
          ]).toJson(),
      ],
    };
  }

  BiteCommentModel _comment(
    CommentRecord c, [
    List<BiteCommentModel> replies = const [],
  ]) => BiteCommentModel(
    id: c.id,
    authorId: c.authorId,
    authorName: P2pPeople.find(c.authorId)?.name ?? '?',
    text: c.text,
    createdAt: c.createdAt,
    parentId: c.parentId,
    isMine: c.authorId == P2pPeople.me,
    replies: replies,
  );
}
