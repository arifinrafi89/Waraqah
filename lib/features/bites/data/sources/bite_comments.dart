import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/bite_rules.dart';
import 'bite_fake_store.dart';
import 'bite_records.dart';

/// Comments with one level of replies, made as "me".
extension BiteComments on BiteFakeStore {
  /// A [parentId] that is itself a reply moves up to its top comment.
  CommentRecord? comment(String biteId, String text, {String? parentId}) {
    if (find(biteId) == null ||
        isBanned(P2pPeople.me) ||
        BiteRules.checkComment(text) != null) {
      return null;
    }
    String? top;
    if (parentId != null) {
      final parent = findComment(parentId);
      if (parent == null || parent.biteId != biteId) return null;
      top = parent.parentId ?? parent.id;
    }
    final comment = CommentRecord(
      id: 'cm-new-${nextId()}',
      biteId: biteId,
      authorId: P2pPeople.me,
      text: text.trim(),
      createdAt: now(),
      parentId: top,
    );
    comments.add(comment);
    return comment;
  }

  /// "me"'s own comments only.
  bool deleteComment(String id) {
    if (findComment(id)?.authorId != P2pPeople.me) return false;
    removeComment(id);
    return true;
  }

  /// Deletes a comment and, for a top comment, its replies.
  void removeComment(String id) =>
      comments.removeWhere((c) => c.id == id || c.parentId == id);
}
