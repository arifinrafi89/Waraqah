import '../../domain/entities/inbox_change.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../models/inbox_thread_model.dart';
import '../sources/inbox_live_source.dart';
import '../sources/inbox_remote_source.dart';

/// No cache: the live feed says when anything changes.
class InboxRepositoryImpl implements InboxRepository {
  InboxRepositoryImpl(this._source, this._live);

  final InboxRemoteSource _source;
  final InboxLiveSource _live;

  @override
  Future<List<InboxThread>> threads({String? listingId}) async => [
    for (final thread in await _source.threads(listingId: listingId))
      thread.toEntity(),
  ];

  @override
  Future<InboxThread?> thread(String id) async =>
      (await _source.thread(id))?.toEntity();

  @override
  Future<InboxThread> open(String listingId) async =>
      (await _source.open(listingId)).toEntity();

  @override
  Future<InboxThread> send(String threadId, String text) async =>
      (await _source.send(threadId, text)).toEntity();

  @override
  Future<InboxThread> makeOffer(OfferRequest request) async =>
      (await _source.makeOffer(request)).toEntity();

  @override
  Future<InboxThread> decide(
    String threadId,
    String offerId, {
    required bool accept,
  }) async =>
      (await _source.decide(threadId, offerId, accept: accept)).toEntity();

  @override
  Future<InboxThread> markRead(String threadId) async =>
      (await _source.markRead(threadId)).toEntity();

  @override
  Future<InboxThread> release(String threadId) async =>
      (await _source.release(threadId)).toEntity();

  @override
  Future<InboxThread> markSold(String threadId) async =>
      (await _source.markSold(threadId)).toEntity();

  @override
  Future<InboxThread> rate(String threadId, int stars, String? comment) async =>
      (await _source.rate(threadId, stars, comment)).toEntity();

  @override
  Stream<InboxChange> changes() =>
      _live.changes().map((change) => change.toEntity());
}
