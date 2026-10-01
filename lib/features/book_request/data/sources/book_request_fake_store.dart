// Requests are matched against the marketplace's Listings, like the
// server will.
import '../../../p2p/data/models/p2p_listing_model.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/book_request.dart';
import '../../domain/entities/request_rules.dart';
import '../models/book_request_model.dart';
import '../models/wanted_book_model.dart';
import 'book_request_seed.dart';

/// Every reader's book requests on the fake backend. The signed-in reader
/// is [P2pPeople.me].
class BookRequestFakeStore {
  BookRequestFakeStore(this.p2p, {DateTime Function()? clock})
    : now = clock ?? DateTime.now {
    requests.addAll(bookRequestSeed(now()));
  }

  final P2pFakeStore p2p;
  final DateTime Function() now;
  final List<BookRequestModel> requests = [];

  /// Listings that are this book, sold by someone other than [readerId]:
  /// on sale now, or (with [any]) any copy they haven't sold yet.
  Iterable<P2pListingModel> _copies(
    BookRequestModel request,
    String readerId, {
    bool any = false,
  }) => p2p.all.where(
    (l) =>
        l.sellerId != readerId &&
        (any
            ? l.status != P2pListingStatus.sold
            : l.status == P2pListingStatus.live) &&
        RequestRules.matches(request.draft, l.title, l.bookId),
  );

  /// The request as its reader sees it, with matches counted now.
  Map<String, dynamic> json(BookRequestModel r) => r
      .copyWith(
        matchCount: _copies(r, r.requesterId).length,
        notifiedSellers: {
          for (final l in _copies(r, r.requesterId, any: true)) l.sellerId,
        }.length,
      )
      .toJson();

  /// `null` when the draft breaks [RequestRules].
  Map<String, dynamic>? create(BookRequestDraft draft) {
    if (RequestRules.check(draft) != null) return null;
    final request = BookRequestModel(
      id: 'rq-${requests.length + 1}',
      title: draft.title,
      author: draft.author,
      bookId: draft.bookId,
      maxPriceBdt: draft.maxPriceBdt,
      note: draft.note,
      createdAt: now(),
    );
    requests.add(request);
    return json(request);
  }

  List<Map<String, dynamic>> mine() => [
    for (final r in requests.reversed)
      if (r.requesterId == P2pPeople.me) json(r),
  ];

  bool close(String id) {
    final i = requests.indexWhere(
      (r) => r.id == id && r.requesterId == P2pPeople.me,
    );
    if (i < 0) return false;
    requests[i] = requests[i].copyWith(isOpen: false);
    return true;
  }

  /// Other readers' open requests for books [P2pPeople.me] is selling.
  List<Map<String, dynamic>> wanted() => [
    for (final r in requests.reversed)
      if (r.isOpen && r.requesterId != P2pPeople.me)
        for (final l in p2p.all)
          if (l.sellerId == P2pPeople.me &&
              l.status != P2pListingStatus.sold &&
              RequestRules.matches(r.draft, l.title, l.bookId))
            WantedBookModel(
              requestId: r.id,
              readerName: P2pPeople.find(r.requesterId)?.name ?? '?',
              title: l.title,
              listingId: l.id,
              createdAt: r.createdAt,
              maxPriceBdt: r.maxPriceBdt,
            ).toJson(),
  ];

  /// Open requests per title, most asked first.
  List<Map<String, dynamic>> demand() {
    final counts = <String, int>{};
    for (final r in requests.where((r) => r.isOpen)) {
      counts[r.title] = (counts[r.title] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return [
      for (final e in sorted)
        BookDemandModel(title: e.key, requests: e.value).toJson(),
    ];
  }
}
