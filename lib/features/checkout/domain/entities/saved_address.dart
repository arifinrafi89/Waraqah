import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../catalog/domain/entities/delivery_area.dart';

part 'saved_address.freezed.dart';

/// Where an order goes. Saved addresses belong to the reader's profile
/// (Niloy's work); until that lands, checkout keeps a stand-in with the same
/// fields.
@freezed
abstract class SavedAddress with _$SavedAddress {
  const factory SavedAddress({
    required String id,

    /// What the reader calls it: "Home", "Office".
    required String label,
    required String recipient,
    required String phone,

    /// House, road and area: "House 12, Road 5, Dhanmondi".
    required String line,
    required String upazila,
    required String district,
    required String division,
  }) = _SavedAddress;
}

extension SavedAddressX on SavedAddress {
  DeliveryArea get area => district == 'Dhaka'
      ? DeliveryArea.insideDhaka
      : DeliveryArea.outsideDhaka;

  /// "House 12, Road 5, Dhanmondi, Dhaka"
  String get oneLine => '$line, $district';
}
