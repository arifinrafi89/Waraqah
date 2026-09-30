import '../../../../core/usecase/usecase.dart';
import '../entities/order.dart';
import '../entities/order_return.dart';
import '../repositories/order_repository.dart';

class RequestReturnParams {
  const RequestReturnParams({
    required this.number,
    required this.reason,
    this.note = '',
  });

  final String number;
  final ReturnReason reason;
  final String note;
}

/// Sends a return request; the note is trimmed and kept short.
class RequestReturn extends UseCase<Order, RequestReturnParams> {
  RequestReturn(this._repository);

  final OrderRepository _repository;

  static const int maxNoteLength = 300;

  @override
  Future<Order> call(RequestReturnParams params) {
    final note = params.note.trim();
    return _repository.requestReturn(
      params.number,
      reason: params.reason,
      note: note.length > maxNoteLength
          ? note.substring(0, maxNoteLength)
          : note,
    );
  }
}
