import '../../../../core/usecase/usecase.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../entities/donation.dart';
import '../repositories/donate_repository.dart';

/// Sends copies of a needed book to a recipient. Refuses cash on delivery
/// (the recipient would be asked to pay) and fewer than one copy before
/// asking the server; the server also checks it isn't more than they need.
class DonateBook extends UseCase<Donation, DonationRequest> {
  DonateBook(this._repository);

  final DonateRepository _repository;

  @override
  Future<Donation> call(DonationRequest params) {
    if (params.quantity < 1) {
      throw ArgumentError.value(params.quantity, 'quantity');
    }
    if (params.payment == PaymentMethod.cashOnDelivery) {
      throw ArgumentError.value(params.payment, 'payment');
    }
    return _repository.donate(params.copyWith(note: params.note.trim()));
  }
}
