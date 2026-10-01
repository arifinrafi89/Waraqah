import '../entities/wallet.dart';

abstract interface class WalletRepository {
  Future<Wallet> fetch();
}
