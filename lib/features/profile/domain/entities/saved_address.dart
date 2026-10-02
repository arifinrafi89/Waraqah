import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../catalog/domain/entities/delivery_area.dart';

part 'saved_address.freezed.dart';

/// A delivery address in the Reader's profile. Checkout delivers to one of
/// these; [isDefault] is preselected.
@freezed
abstract class SavedAddress with _$SavedAddress {
  const factory SavedAddress({
    /// Empty for a new address: the server gives it one.
    @Default('') String id,

    /// What the reader calls it: "Home", "Office".
    required String label,
    required String recipient,
    required String phone,

    /// House, road and area: "House 12, Road 5, Dhanmondi".
    required String line,

    /// English names, from `/geo`.
    required String upazila,
    required String district,
    required String division,
    @Default(false) bool isDefault,
  }) = _SavedAddress;
}

extension SavedAddressX on SavedAddress {
  DeliveryArea get area => district == 'Dhaka'
      ? DeliveryArea.insideDhaka
      : DeliveryArea.outsideDhaka;

  /// "House 12, Road 5, Dhanmondi, Dhaka"
  String get oneLine => '$line, $district';
}
