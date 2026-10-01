import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../data/repositories/sell_back_repository_impl.dart';
import '../../data/sources/sell_back_remote_source.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/repositories/sell_back_repository.dart';
import '../../domain/usecases/create_sell_back.dart';
import '../../domain/usecases/find_sell_back_books.dart';
import '../../domain/usecases/get_my_sell_backs.dart';
import '../../domain/usecases/get_sell_back_book.dart';
import '../../domain/usecases/get_trade_in_queue.dart';
import '../../domain/usecases/grade_trade_in.dart';

final sellBackRepositoryProvider = Provider<SellBackRepository>(
  (ref) => SellBackRepositoryImpl(SellBackRemoteSource(ref.watch(dioProvider))),
);

final createSellBackProvider = Provider<CreateSellBack>(
  (ref) => CreateSellBack(ref.watch(sellBackRepositoryProvider)),
);

/// Catalog Books matching what the reader typed.
final sellBackBooksProvider = FutureProvider.autoDispose
    .family<List<SellBackBook>, String>(
      (ref, query) =>
          FindSellBackBooks(ref.watch(sellBackRepositoryProvider)).call(query),
    );

final sellBackBookProvider = FutureProvider.autoDispose
    .family<SellBackBook?, String>(
      (ref, id) =>
          GetSellBackBook(ref.watch(sellBackRepositoryProvider)).call(id),
    );

/// The reader's Sell Backs, newest first. Empty for a guest.
final mySellBacksProvider = FutureProvider.autoDispose<List<SellBack>>((
  ref,
) async {
  if (ref.watch(sessionProvider) == null) return const [];
  return GetMySellBacks(ref.watch(sellBackRepositoryProvider))
      .call(const NoParams());
});

/// Picked-up books waiting for staff to grade them.
class TradeInQueueNotifier extends AsyncNotifier<List<SellBack>> {
  @override
  Future<List<SellBack>> build() =>
      GetTradeInQueue(ref.read(sellBackRepositoryProvider))
          .call(const NoParams());

  Future<void> grade(
    String id,
    BookCondition condition, {
    required bool accept,
  }) async => state = AsyncData(
    await GradeTradeIn(ref.read(sellBackRepositoryProvider)).call((
      id: id,
      condition: condition,
      accept: accept,
      by: ref.read(sessionProvider)?.name ?? '',
    )),
  );
}

final tradeInQueueProvider =
    AsyncNotifierProvider<TradeInQueueNotifier, List<SellBack>>(
      TradeInQueueNotifier.new,
    );
