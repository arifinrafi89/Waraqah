import '../../domain/entities/wallet.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/wallet_model.dart';
import '../sources/wallet_remote_source.dart';

/// No cache: the balance changes with orders.
class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl(this._source);

  final WalletRemoteSource _source;

  @override
  Future<Wallet> fetch() async => (await _source.fetch()).toEntity();
}
