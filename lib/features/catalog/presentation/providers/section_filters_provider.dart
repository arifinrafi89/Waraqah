import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_filters.dart';

/// The Class, Exam and Subject picked on one Section page, as the filters
/// its book list uses. Forgotten when the page closes.
class SectionFiltersNotifier extends Notifier<CatalogFilters> {
  SectionFiltersNotifier(this.section);

  final Section section;

  @override
  CatalogFilters build() => CatalogFilters(section: section);

  /// Picks one chip in its row; tapping the picked chip clears that row.
  void toggle({int? classLevel, Exam? exam, String? subjectId}) =>
      state = CatalogFilters(
        section: section,
        classLevel: _toggle(classLevel, state.classLevel),
        exam: _toggle(exam, state.exam),
        subjectId: _toggle(subjectId, state.subjectId),
      );

  void clear() => state = build();
}

T? _toggle<T>(T? tapped, T? current) => tapped == null
    ? current
    : tapped == current
    ? null
    : tapped;

final sectionFiltersProvider = NotifierProvider.autoDispose
    .family<SectionFiltersNotifier, CatalogFilters, Section>(
      SectionFiltersNotifier.new,
    );
