import '../../../../core/usecase/usecase.dart';
import '../entities/wallet.dart';
import '../repositories/wallet_repository.dart';

class GetWallet extends UseCase<Wallet, NoParams> {
  GetWallet(this._repository);

  final WalletRepository _repository;

  @override
  Future<Wallet> call(NoParams params) => _repository.fetch();
}
