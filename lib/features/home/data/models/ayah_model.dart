import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/ayah.dart';

part 'ayah_model.freezed.dart';
part 'ayah_model.g.dart';

/// JSON shape of an [Ayah], as it comes off the wire (or a fixture).
@freezed
abstract class AyahModel with _$AyahModel {
  const factory AyahModel({
    required String arabic,
    required String translation,
    required String surahEn,
    required String surahBn,
    required int surahNumber,
    required int verseNumber,
  }) = _AyahModel;

  factory AyahModel.fromJson(Map<String, dynamic> json) =>
      _$AyahModelFromJson(json);
}

extension AyahModelX on AyahModel {
  Ayah toEntity() => Ayah(
    arabic: arabic,
    translation: translation,
    surahEn: surahEn,
    surahBn: surahBn,
    surahNumber: surahNumber,
    verseNumber: verseNumber,
  );
}
