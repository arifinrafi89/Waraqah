import 'package:freezed_annotation/freezed_annotation.dart';

part 'bite.freezed.dart';
part 'bite.g.dart';

/// A short post in the Book-Bites social feed.
@freezed
abstract class Bite with _$Bite {
  const factory Bite({
    required String id,
    required String authorName,
    required String authorHandle,
    required String text,
    String? taggedBookTitle,
    String? taggedBookId,
    @Default(0) int avatarSeed,
  }) = _Bite;

  factory Bite.fromJson(Map<String, dynamic> json) => _$BiteFromJson(json);
}

extension BiteX on Bite {
  String get initial => authorName.isEmpty ? '?' : authorName[0].toUpperCase();
  bool get hasBookTag => taggedBookTitle != null;
}
