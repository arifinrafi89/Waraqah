import '../../../../core/usecase/usecase.dart';
import '../entities/inbox_thread.dart';
import '../entities/offer_rules.dart';
import '../repositories/inbox_repository.dart';

class MakeOfferParams {
  const MakeOfferParams({
    required this.request,
    required this.askingBdt,
    required this.negotiable,
  });

  final OfferRequest request;
  final int askingBdt;
  final bool negotiable;
}

/// Sends the buyer's offer (see [OfferRules]) to the seller's inbox.
class MakeOffer extends UseCase<InboxThread, MakeOfferParams> {
  MakeOffer(this._repository);

  final InboxRepository _repository;

  @override
  Future<InboxThread> call(MakeOfferParams params) {
    final problem = OfferRules.check(
      amountBdt: params.request.amountBdt,
      askingBdt: params.askingBdt,
      negotiable: params.negotiable,
    );
    if (problem != null) throw ArgumentError.value(problem, 'amountBdt');
    return _repository.makeOffer(params.request);
  }
}
