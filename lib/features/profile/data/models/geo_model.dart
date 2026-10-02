import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/geo.dart';

part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

/// JSON shape of a [GeoDivision].
@freezed
abstract class GeoDivisionModel with _$GeoDivisionModel {
  const factory GeoDivisionModel({
    required String name,
    required String nameBn,
    required List<GeoDistrictModel> districts,
  }) = _GeoDivisionModel;

  factory GeoDivisionModel.fromJson(Map<String, dynamic> json) =>
      _$GeoDivisionModelFromJson(json);
}

/// JSON shape of a [GeoDistrict].
@freezed
abstract class GeoDistrictModel with _$GeoDistrictModel {
  const factory GeoDistrictModel({
    required String name,
    required String nameBn,
    required List<String> upazilas,
  }) = _GeoDistrictModel;

  factory GeoDistrictModel.fromJson(Map<String, dynamic> json) =>
      _$GeoDistrictModelFromJson(json);
}

extension GeoDivisionModelX on GeoDivisionModel {
  GeoDivision toEntity() => GeoDivision(
    name: name,
    nameBn: nameBn,
    districts: [
      for (final d in districts)
        GeoDistrict(name: d.name, nameBn: d.nameBn, upazilas: d.upazilas),
    ],
  );
}
