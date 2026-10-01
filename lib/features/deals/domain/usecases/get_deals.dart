import '../../../../core/usecase/usecase.dart';
import '../entities/deals.dart';
import '../repositories/deals_repository.dart';

/// What's on offer now: a flash sale that has ended is dropped, and
/// pre-orders come soonest release first.
class GetDeals extends UseCase<Deals, NoParams> {
  GetDeals(this._repository, {DateTime Function()? clock})
    : _now = clock ?? DateTime.now;

  final DealsRepository _repository;
  final DateTime Function() _now;

  @override
  Future<Deals> call(NoParams params) async {
    final deals = await _repository.current();
    final sale = deals.flashSale;
    return deals.copyWith(
      flashSale: sale != null && sale.endsAt.isAfter(_now()) ? sale : null,
      preorders: [...deals.preorders]
        ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate)),
    );
  }
}
