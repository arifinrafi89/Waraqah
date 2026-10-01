// The fake backend looks reported things up in each feature's own records,
// like the real server's database will.
import '../../../bites/data/sources/bite_fixtures.dart';
import '../../../catalog/data/sources/seed/review_seed.dart';
import '../../../inbox/data/sources/inbox_fake_store.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../report/domain/entities/content_report.dart';

/// What was reported and whose it is.
typedef ReportSubject = ({String preview, String ownerId, String ownerName});

/// Finds the reported Listing, reader, message, Bite or review.
class ModerationSubjects {
  ModerationSubjects(this.p2p, this.inbox);

  final P2pFakeStore p2p;
  final InboxFakeStore? inbox;

  ReportSubject find(ReportTargetKind kind, String id) =>
      switch (kind) {
        ReportTargetKind.listing => _listing(id),
        ReportTargetKind.user => _reader(id),
        ReportTargetKind.message => _message(id),
        ReportTargetKind.bite => _bite(id),
        ReportTargetKind.review => _review(id),
        ReportTargetKind.comment => null,
      } ??
      (preview: id, ownerId: '', ownerName: '?');

  ReportSubject? _listing(String id) => switch (p2p.find(id)) {
    final l? => (
      preview: l.title,
      ownerId: l.sellerId,
      ownerName: l.sellerName,
    ),
    null => null,
  };

  ReportSubject? _reader(String id) => switch (P2pPeople.find(id)) {
    final p? => (
      preview: '${p.name} · ${p.area}, ${p.district}',
      ownerId: p.id,
      ownerName: p.name,
    ),
    null => null,
  };

  ReportSubject? _message(String id) {
    for (final thread in inbox?.threads.values ?? const <Never>[]) {
      for (final message in thread.messages) {
        if (message.id != id) continue;
        final author = P2pPeople.find(message.authorId);
        return (
          preview: message.text ?? '',
          ownerId: message.authorId,
          ownerName: author?.name ?? '?',
        );
      }
    }
    return null;
  }

  ReportSubject? _bite(String id) =>
      switch (BiteFixtures.feed.where((b) => b.id == id).firstOrNull) {
        final b? => (
          preview: b.text,
          ownerId: 'bite:${b.authorName}',
          ownerName: b.authorName,
        ),
        null => null,
      };

  ReportSubject? _review(String id) {
    final review = ReviewSeed.byBookId.values
        .expand((reviews) => reviews)
        .where((r) => r.id == id)
        .firstOrNull;
    if (review == null) return null;
    return (
      preview: review.text,
      ownerId: 'review:${review.reviewerName}',
      ownerName: review.reviewerName,
    );
  }
}
