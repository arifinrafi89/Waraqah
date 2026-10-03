import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipient.dart';

part 'donate_place_draft.freezed.dart';

/// A verified place as Staff edit it in the Admin area: who they are,
/// where, and how many copies of which Books they asked for.
@freezed
abstract class DonatePlaceDraft with _$DonatePlaceDraft {
  const factory DonatePlaceDraft({
    /// Empty for a new place.
    @Default('') String id,
    @Default('') String name,
    @Default(RecipientKind.library) RecipientKind kind,
    @Default('') String district,
    @Default('') String area,
    @Default('') String story,
    @Default(<PlaceNeedDraft>[]) List<PlaceNeedDraft> needs,
  }) = _DonatePlaceDraft;
}

/// One Book a place asks for, and how many copies.
typedef PlaceNeedDraft = ({String bookId, String title, int wanted});

enum PlaceProblem { name, district, area, story, noNeeds, badCount }

/// What a verified place needs before Staff save it, checked in the app
/// and by the server.
abstract final class PlaceRules {
  static const int maxName = 80;
  static const int maxStory = 300;
  static const int maxCopies = 100;

  /// `null` when [draft] can be saved.
  static PlaceProblem? check(DonatePlaceDraft draft) {
    final name = draft.name.trim().length;
    if (name < 3 || name > maxName) return PlaceProblem.name;
    if (draft.district.trim().isEmpty) return PlaceProblem.district;
    if (draft.area.trim().isEmpty) return PlaceProblem.area;
    final story = draft.story.trim().length;
    if (story < 10 || story > maxStory) return PlaceProblem.story;
    if (draft.needs.isEmpty) return PlaceProblem.noNeeds;
    if (draft.needs.any((n) => n.wanted < 1 || n.wanted > maxCopies)) {
      return PlaceProblem.badCount;
    }
    return null;
  }
}
