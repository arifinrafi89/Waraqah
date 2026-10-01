import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../repositories/inbox_repository.dart';

class DecideOfferParams {
  const DecideOfferParams({
    required this.threadId,
    required this.offerId,
    required this.accept,
  });

  final String threadId;
  final String offerId;
  final bool accept;
}

/// The seller accepts an offer, which reserves the book for that buyer, or
/// declines it.
class DecideOffer extends UseCase<InboxThread, DecideOfferParams> {
  DecideOffer(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(DecideOfferParams params) => _repository.decide(
    params.threadId,
    params.offerId,
    accept: params.accept,
  );
}
