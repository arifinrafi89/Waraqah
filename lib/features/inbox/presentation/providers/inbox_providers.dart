import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../data/repositories/inbox_repository_impl.dart';
import '../../data/sources/inbox_live_source.dart';
import '../../data/sources/inbox_remote_source.dart';
import '../../domain/entities/inbox_change.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../../domain/usecases/get_inbox.dart';
import '../../domain/usecases/watch_inbox.dart';

final inboxRepositoryProvider = Provider<InboxRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return InboxRepositoryImpl(InboxRemoteSource(dio), InboxLiveSource(dio));
});

final getInboxProvider = Provider<GetInbox>(
  (ref) => GetInbox(ref.watch(inboxRepositoryProvider)),
);

final watchInboxProvider = Provider<WatchInbox>(
  (ref) => WatchInbox(ref.watch(inboxRepositoryProvider)),
);

/// The live connection: one event per change, while signed in.
final inboxChangesProvider = StreamProvider<InboxChange>((ref) {
  if (ref.watch(sessionProvider) == null) return const Stream.empty();
  final watch = ref.watch(watchInboxProvider);
  return Stream.fromFuture(watch(const NoParams()))
      .asyncExpand((changes) => changes);
});

/// The reader's threads, newest activity first. Kept up to date by the
/// live connection, which also refreshes the listing views a deal changes.
class InboxNotifier extends AsyncNotifier<List<InboxThread>> {
  @override
  Future<List<InboxThread>> build() async {
    if (ref.watch(sessionProvider) == null) return const [];
    ref.listen(inboxChangesProvider, (_, next) {
      if (next.value case final change?) _changed(change);
    });
    return ref.read(getInboxProvider).call(null);
  }

  Future<void> _changed(InboxChange change) async {
    ref
      ..invalidate(p2pListingDetailProvider(change.listingId))
      ..invalidate(p2pListingsProvider)
      ..invalidate(nearbyListingsProvider)
      ..invalidate(myListingsProvider)
      ..invalidate(listingsForBookProvider);
    try {
      state = AsyncData(await ref.read(getInboxProvider).call(null));
    } catch (_) {
      // Keep what's shown; the next change tries again.
    }
  }
}

final inboxProvider = AsyncNotifierProvider<InboxNotifier, List<InboxThread>>(
  InboxNotifier.new,
);

/// New offers and messages: the badge on the inbox icon.
final inboxUnreadProvider = Provider<int>(
  (ref) =>
      ref.watch(inboxProvider).value?.fold(0, (sum, t) => sum! + t.unread) ?? 0,
);

/// Threads about one listing: a buyer's own one, or every buyer's for the
/// seller. Refreshed when the live connection says the listing changed.
final listingThreadsProvider = FutureProvider.autoDispose
    .family<List<InboxThread>, String>((ref, listingId) {
      if (ref.watch(sessionProvider) == null) return const [];
      ref.listen(inboxChangesProvider, (_, next) {
        if (next.value?.listingId == listingId) ref.invalidateSelf();
      });
      return ref.read(getInboxProvider).call(listingId);
    });
