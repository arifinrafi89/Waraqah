import '../../../../core/usecase/usecase.dart';
import '../entities/handled_sale.dart';
import '../entities/sale_math.dart';
import '../repositories/handled_sale_repository.dart';

/// Tells a moderator the book isn't as described: a reason, a note of up
/// to 300 characters and up to three photos.
class OpenDispute extends UseCase<HandledSale, DisputeDraft> {
  OpenDispute(this._repository);

  final HandledSaleRepository _repository;

  @override
  Future<HandledSale> call(DisputeDraft params) {
    final note = params.note?.trim() ?? '';
    if (note.length > SaleMath.maxDisputeNote ||
        params.photos.length > SaleMath.maxDisputePhotos) {
      throw ArgumentError('Too much in the dispute');
    }
    return _repository.dispute(
      params.copyWith(note: note.isEmpty ? null : note),
    );
  }
}
