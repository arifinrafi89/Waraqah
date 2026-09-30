import '../../domain/entities/points_account.dart';
import '../../domain/repositories/points_repository.dart';
import '../models/points_model.dart';
import '../sources/points_remote_source.dart';

/// No cache: the balance changes with every order.
class PointsRepositoryImpl implements PointsRepository {
  PointsRepositoryImpl(this._source);

  final PointsRemoteSource _source;

  @override
  Future<PointsAccount> account() async => (await _source.account()).toEntity();
}
