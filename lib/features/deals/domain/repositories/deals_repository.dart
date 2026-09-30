import '../entities/deals.dart';

abstract interface class DealsRepository {
  Future<Deals> current();
}
