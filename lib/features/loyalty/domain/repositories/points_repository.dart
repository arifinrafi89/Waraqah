import '../entities/points_account.dart';

/// The signed-in reader's points. Earning and spending happen on the server
/// when an order is placed or cancelled.
abstract interface class PointsRepository {
  Future<PointsAccount> account();
}
