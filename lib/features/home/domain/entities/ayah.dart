import 'package:freezed_annotation/freezed_annotation.dart';

part 'ayah.freezed.dart';
part 'ayah.g.dart';

/// The daily Qur'anic verse shown at the top of the home screen.
@freezed
abstract class Ayah with _$Ayah {
  const factory Ayah({
    required String arabic,
    required String translation,
    required String surahEn,
    required String surahBn,
    required int surahNumber,
    required int verseNumber,
  }) = _Ayah;

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);
}

extension AyahX on Ayah {
  String reference(bool isBangla) =>
      '${isBangla ? surahBn : surahEn} · $surahNumber:$verseNumber';
}
