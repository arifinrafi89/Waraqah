import 'package:freezed_annotation/freezed_annotation.dart';

part 'look_inside.freezed.dart';

/// One line of a table of contents: a part heading, or a chapter in it.
@freezed
abstract class ContentsEntry with _$ContentsEntry {
  const factory ContentsEntry({
    required String title,
    @Default(false) bool isPart,
  }) = _ContentsEntry;
}

/// A peek at a book before buying it: its table of contents and the first
/// few pages.
@freezed
abstract class LookInside with _$LookInside {
  const factory LookInside({
    @Default(<ContentsEntry>[]) List<ContentsEntry> contents,

    /// Each page's text, in reading order.
    @Default(<String>[]) List<String> samplePages,
  }) = _LookInside;
}
