import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/geo.dart';
import '../../domain/entities/saved_address.dart';
import '../../domain/usecases/delete_address.dart';
import '../../domain/usecases/get_addresses.dart';
import '../../domain/usecases/get_geo.dart';
import '../../domain/usecases/save_address.dart';
import '../../domain/usecases/set_default_address.dart';
import 'profile_providers.dart';

final getAddressesProvider = Provider<GetAddresses>(
  (ref) => GetAddresses(ref.watch(profileRepositoryProvider)),
);

final saveAddressProvider = Provider<SaveAddress>(
  (ref) => SaveAddress(ref.watch(profileRepositoryProvider)),
);

final deleteAddressProvider = Provider<DeleteAddress>(
  (ref) => DeleteAddress(ref.watch(profileRepositoryProvider)),
);

final setDefaultAddressProvider = Provider<SetDefaultAddress>(
  (ref) => SetDefaultAddress(ref.watch(profileRepositoryProvider)),
);

final getGeoProvider = Provider<GetGeo>(
  (ref) => GetGeo(ref.watch(profileRepositoryProvider)),
);

/// The signed-in Reader's saved addresses, default first; empty for a
/// Guest. Checkout reads these too.
class AddressesNotifier extends AsyncNotifier<List<SavedAddress>> {
  @override
  Future<List<SavedAddress>> build() async {
    if (ref.watch(sessionProvider.select((u) => u?.id)) == null) return [];
    return ref.read(getAddressesProvider).call(const NoParams());
  }

  /// Throws an `AddressProblem` when [address] breaks `AddressRules`.
  Future<void> save(SavedAddress address) async =>
      state = AsyncData(await ref.read(saveAddressProvider).call(address));

  Future<void> delete(String id) async =>
      state = AsyncData(await ref.read(deleteAddressProvider).call(id));

  Future<void> makeDefault(String id) async =>
      state = AsyncData(await ref.read(setDefaultAddressProvider).call(id));
}

final addressesProvider =
    AsyncNotifierProvider<AddressesNotifier, List<SavedAddress>>(
      AddressesNotifier.new,
    );

/// The geo tree, read once and kept while the app runs.
final geoProvider = FutureProvider<List<GeoDivision>>(
  (ref) => ref.watch(getGeoProvider).call(const NoParams()),
);
