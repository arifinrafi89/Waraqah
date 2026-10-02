import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo.freezed.dart';

/// One of Bangladesh's 8 divisions, for the address pickers.
@freezed
abstract class GeoDivision with _$GeoDivision {
  const factory GeoDivision({
    required String name,
    required String nameBn,
    required List<GeoDistrict> districts,
  }) = _GeoDivision;
}

/// A district and its upazilas (English names only for now).
@freezed
abstract class GeoDistrict with _$GeoDistrict {
  const factory GeoDistrict({
    required String name,
    required String nameBn,
    required List<String> upazilas,
  }) = _GeoDistrict;
}
