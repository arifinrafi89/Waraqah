import '../../domain/entities/geo.dart';
import '../../domain/entities/profile_details.dart';
import '../../domain/entities/profile_prefs.dart';
import '../../domain/entities/saved_address.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/geo_model.dart';
import '../models/profile_details_model.dart';
import '../models/profile_prefs_model.dart';
import '../models/saved_address_model.dart';
import '../sources/address_remote_source.dart';
import '../sources/profile_remote_source.dart';

/// No cache: every page shows what the server has now. The geo tree is
/// kept by its provider instead.
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._source, this._addresses);

  final ProfileRemoteSource _source;
  final AddressRemoteSource _addresses;

  @override
  Future<ProfileDetails> profile() async =>
      (await _source.profile()).toEntity();

  @override
  Future<ProfileDetails> saveProfile(ProfileDetails details) async =>
      (await _source.saveProfile(ProfileDetailsModel.fromEntity(details)))
          .toEntity();

  @override
  Future<ProfilePrefs> prefs() async => (await _source.prefs()).toEntity();

  @override
  Future<ProfilePrefs> savePrefs(ProfilePrefs prefs) async =>
      (await _source.savePrefs(ProfilePrefsModel.fromEntity(prefs))).toEntity();

  @override
  Future<void> deleteAccount() => _source.deleteAccount();

  @override
  Future<List<SavedAddress>> addresses() async =>
      _entities(await _addresses.addresses());

  @override
  Future<List<SavedAddress>> saveAddress(SavedAddress address) async =>
      _entities(await _addresses.save(SavedAddressModel.fromEntity(address)));

  @override
  Future<List<SavedAddress>> deleteAddress(String id) async =>
      _entities(await _addresses.delete(id));

  @override
  Future<List<SavedAddress>> setDefaultAddress(String id) async =>
      _entities(await _addresses.makeDefault(id));

  @override
  Future<List<GeoDivision>> geo() async => [
    for (final division in await _addresses.geo()) division.toEntity(),
  ];

  List<SavedAddress> _entities(List<SavedAddressModel> models) => [
    for (final model in models) model.toEntity(),
  ];
}
