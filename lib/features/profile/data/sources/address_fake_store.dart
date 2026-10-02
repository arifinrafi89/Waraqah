import '../../domain/entities/address_rules.dart';
import '../models/saved_address_model.dart';

/// The signed-in Reader's ("me") saved addresses, as the fake backend keeps
/// them. Checkout's `/orders/place` delivers to one of these.
class AddressFakeStore {
  final List<SavedAddressModel> _addresses = [
    const SavedAddressModel(
      id: 'addr-home',
      label: 'Home',
      recipient: 'Rahim Uddin',
      phone: '01711000000',
      line: 'House 12, Road 5, Dhanmondi',
      upazila: 'Dhaka South City',
      district: 'Dhaka',
      division: 'Dhaka',
      isDefault: true,
    ),
    const SavedAddressModel(
      id: 'addr-family',
      label: 'Family home',
      recipient: 'Rahim Uddin',
      phone: '01711000000',
      line: 'Mira Bazar, Zindabazar',
      upazila: 'Sylhet Sadar',
      district: 'Sylhet',
      division: 'Sylhet',
    ),
  ];
  int _ids = 0;

  SavedAddressModel? find(String id) =>
      _addresses.where((a) => a.id == id).firstOrNull;

  /// The default first, then the rest in the order they were added.
  List<Map<String, dynamic>> json() => [
    for (final a in _addresses.where((a) => a.isDefault)) a.toJson(),
    for (final a in _addresses.where((a) => !a.isDefault)) a.toJson(),
  ];

  /// Adds [address] (no id) or replaces the one with its id. `false` when it
  /// breaks [AddressRules] or the id is unknown. The first address becomes
  /// the default.
  bool save(SavedAddressModel address) {
    final entity = address.toEntity();
    if (AddressRules.check(entity) != null) return false;
    final tidy = SavedAddressModel.fromEntity(AddressRules.tidy(entity));
    if (address.id.isEmpty) {
      _addresses.add(
        tidy.copyWith(id: 'addr-${++_ids}', isDefault: _addresses.isEmpty),
      );
      return true;
    }
    final i = _addresses.indexWhere((a) => a.id == address.id);
    if (i < 0) return false;
    _addresses[i] = tidy.copyWith(isDefault: _addresses[i].isDefault);
    return true;
  }

  /// Deleting the default makes the next one the default.
  bool delete(String id) {
    final gone = find(id);
    if (gone == null) return false;
    _addresses.remove(gone);
    if (gone.isDefault && _addresses.isNotEmpty) makeDefault(_addresses[0].id);
    return true;
  }

  bool makeDefault(String id) {
    if (find(id) == null) return false;
    for (var i = 0; i < _addresses.length; i++) {
      _addresses[i] = _addresses[i].copyWith(isDefault: _addresses[i].id == id);
    }
    return true;
  }
}
