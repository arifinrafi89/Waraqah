import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/wallet_repository_impl.dart';
import '../../data/sources/wallet_remote_source.dart';
import '../../domain/entities/wallet.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../domain/usecases/get_wallet.dart';

final walletRepositoryProvider = Provider<WalletRepository>(
  (ref) => WalletRepositoryImpl(WalletRemoteSource(ref.watch(dioProvider))),
);

final getWalletProvider = Provider<GetWallet>(
  (ref) => GetWallet(ref.watch(walletRepositoryProvider)),
);

/// The signed-in reader's wallet; empty for a guest. Refresh it after an
/// order is placed or cancelled, or a return is decided.
final walletProvider = FutureProvider<Wallet>((ref) async {
  if (ref.watch(sessionProvider) == null) return const Wallet();
  return ref.watch(getWalletProvider).call(const NoParams());
});
