import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/book_request_repository_impl.dart';
import '../../data/sources/book_request_remote_source.dart';
import '../../domain/entities/book_request.dart';
import '../../domain/repositories/book_request_repository.dart';
import '../../domain/usecases/close_book_request.dart';
import '../../domain/usecases/create_book_request.dart';
import '../../domain/usecases/get_book_demand.dart';
import '../../domain/usecases/get_my_requests.dart';
import '../../domain/usecases/get_wanted_books.dart';

final bookRequestRepositoryProvider = Provider<BookRequestRepository>(
  (ref) => BookRequestRepositoryImpl(
    BookRequestRemoteSource(ref.watch(dioProvider)),
  ),
);

final createBookRequestProvider = Provider<CreateBookRequest>(
  (ref) => CreateBookRequest(ref.watch(bookRequestRepositoryProvider)),
);

final getMyRequestsProvider = Provider<GetMyRequests>(
  (ref) => GetMyRequests(ref.watch(bookRequestRepositoryProvider)),
);

final closeBookRequestProvider = Provider<CloseBookRequest>(
  (ref) => CloseBookRequest(ref.watch(bookRequestRepositoryProvider)),
);

final getWantedBooksProvider = Provider<GetWantedBooks>(
  (ref) => GetWantedBooks(ref.watch(bookRequestRepositoryProvider)),
);

final getBookDemandProvider = Provider<GetBookDemand>(
  (ref) => GetBookDemand(ref.watch(bookRequestRepositoryProvider)),
);

/// The signed-in reader's requests, newest first. Empty for a guest.
class MyRequestsNotifier extends AsyncNotifier<List<BookRequest>> {
  @override
  Future<List<BookRequest>> build() async {
    if (ref.watch(sessionProvider) == null) return const [];
    return ref.read(getMyRequestsProvider).call(const NoParams());
  }

  Future<BookRequest> create(BookRequestDraft draft) async {
    final request = await ref.read(createBookRequestProvider).call(draft);
    ref.invalidateSelf();
    return request;
  }

  Future<void> close(String id) async =>
      state = AsyncData(await ref.read(closeBookRequestProvider).call(id));
}

final myRequestsProvider =
    AsyncNotifierProvider<MyRequestsNotifier, List<BookRequest>>(
      MyRequestsNotifier.new,
    );

/// Other readers looking for books the signed-in reader is selling.
final wantedBooksProvider = FutureProvider<List<WantedBook>>((ref) async {
  if (ref.watch(sessionProvider) == null) return const [];
  return ref.watch(getWantedBooksProvider).call(const NoParams());
});

/// Titles readers asked for, most asked first: demand for the admin
/// dashboard (Niloy).
final bookDemandProvider = FutureProvider<List<BookDemand>>(
  (ref) => ref.watch(getBookDemandProvider).call(const NoParams()),
);
