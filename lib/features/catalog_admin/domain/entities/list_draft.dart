import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../../catalog/domain/entities/booklist.dart';
import '../../../catalog/domain/entities/collection.dart';

part 'list_draft.freezed.dart';

/// A Collection, or with a [kind] a Staff Booklist, as Staff fill it in on
/// the builder. No [id] = a new one; the server sets the id.
@freezed
abstract class ListDraft with _$ListDraft {
  const factory ListDraft({
    String? id,
    @Default('') String titleEn,
    @Default('') String titleBn,
    @Default('') String noteEn,
    @Default('') String noteBn,
    Section? section,
    String? expertId,

    /// `null` for a Collection.
    BooklistKind? kind,
    @Default(<String>[]) List<String> bookIds,
  }) = _ListDraft;

  factory ListDraft.ofCollection(Collection c) => ListDraft(
    id: c.id,
    titleEn: c.titleEn,
    titleBn: c.titleBn,
    noteEn: c.noteEn,
    noteBn: c.noteBn,
    section: c.section,
    expertId: c.expert?.id,
    bookIds: [for (final b in c.books) b.id],
  );

  factory ListDraft.ofBooklist(Booklist b) => ListDraft(
    id: b.id,
    titleEn: b.titleEn,
    titleBn: b.titleBn,
    noteEn: b.noteEn ?? '',
    noteBn: b.noteBn ?? '',
    kind: b.kind,
    bookIds: [for (final book in b.books) book.id],
  );
}

extension ListDraftX on ListDraft {
  bool get isBooklist => kind != null;
}
