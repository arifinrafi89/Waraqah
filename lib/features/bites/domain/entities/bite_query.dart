import 'package:freezed_annotation/freezed_annotation.dart';

part 'bite_query.freezed.dart';

/// Which Bites a feed shows: For You or Following, optionally only those
/// about one Book or by one Reader.
@freezed
abstract class BiteQuery with _$BiteQuery {
  const factory BiteQuery({
    @Default(false) bool following,
    String? bookId,
    String? authorId,
  }) = _BiteQuery;
}

/// A new Bite, or an edit when [id] is set.
@freezed
abstract class BiteDraft with _$BiteDraft {
  const factory BiteDraft({
    String? id,
    required String text,
    String? bookId,
    @Default(false) bool spoiler,
  }) = _BiteDraft;
}
