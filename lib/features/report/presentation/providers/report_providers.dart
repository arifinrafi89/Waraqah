import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../data/repositories/report_repository_impl.dart';
import '../../data/sources/report_remote_source.dart';
import '../../domain/entities/blocked_reader.dart';
import '../../domain/repositories/report_repository.dart';
import '../../domain/usecases/block_reader.dart';
import '../../domain/usecases/get_blocked_readers.dart';
import '../../domain/usecases/report_content.dart';
import '../../domain/usecases/unblock_reader.dart';

final reportRepositoryProvider = Provider<ReportRepository>(
  (ref) => ReportRepositoryImpl(ReportRemoteSource(ref.watch(dioProvider))),
);

final reportContentProvider = Provider<ReportContent>(
  (ref) => ReportContent(ref.watch(reportRepositoryProvider)),
);

final getBlockedReadersProvider = Provider<GetBlockedReaders>(
  (ref) => GetBlockedReaders(ref.watch(reportRepositoryProvider)),
);

final blockReaderProvider = Provider<BlockReader>(
  (ref) => BlockReader(ref.watch(reportRepositoryProvider)),
);

final unblockReaderProvider = Provider<UnblockReader>(
  (ref) => UnblockReader(ref.watch(reportRepositoryProvider)),
);

/// The readers the signed-in reader blocked, newest first. Empty for a
/// guest. Blocking or unblocking reloads the marketplace.
class BlockedReadersNotifier extends AsyncNotifier<List<BlockedReader>> {
  @override
  Future<List<BlockedReader>> build() async {
    if (ref.watch(sessionProvider) == null) return const [];
    return ref.read(getBlockedReadersProvider).call(const NoParams());
  }

  Future<void> block(String readerId) =>
      _change(() => ref.read(blockReaderProvider).call(readerId));

  Future<void> unblock(String readerId) =>
      _change(() => ref.read(unblockReaderProvider).call(readerId));

  Future<void> _change(Future<List<BlockedReader>> Function() action) async {
    state = AsyncData(await action());
    ref
      ..invalidate(p2pListingsProvider)
      ..invalidate(nearbyListingsProvider)
      ..invalidate(listingsForBookProvider);
  }
}

final blockedReadersProvider =
    AsyncNotifierProvider<BlockedReadersNotifier, List<BlockedReader>>(
      BlockedReadersNotifier.new,
    );

/// Whether the signed-in reader blocked [readerId].
final isBlockedProvider = Provider.family<bool, String>(
  (ref, readerId) =>
      ref.watch(blockedReadersProvider).value?.any((r) => r.id == readerId) ??
      false,
);
