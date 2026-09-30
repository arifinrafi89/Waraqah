import '../../../../core/usecase/usecase.dart';
import '../entities/offers.dart';
import '../repositories/offers_repository.dart';

/// What's on offer now: a flash sale that has ended is dropped, and
/// pre-orders come soonest release first.
class GetOffers extends UseCase<Offers, NoParams> {
  GetOffers(this._repository, {DateTime Function()? clock})
    : _now = clock ?? DateTime.now;

  final OffersRepository _repository;
  final DateTime Function() _now;

  @override
  Future<Offers> call(NoParams params) async {
    final offers = await _repository.current();
    final sale = offers.flashSale;
    return offers.copyWith(
      flashSale: sale != null && sale.endsAt.isAfter(_now()) ? sale : null,
      preorders: [...offers.preorders]
        ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate)),
    );
  }
}
