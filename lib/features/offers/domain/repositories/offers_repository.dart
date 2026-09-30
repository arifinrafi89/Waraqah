import '../entities/offers.dart';

abstract interface class OffersRepository {
  Future<Offers> current();
}
