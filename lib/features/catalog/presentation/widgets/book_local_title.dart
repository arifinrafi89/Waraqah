import 'package:flutter/widgets.dart';

import '../../../../core/models/book.dart';

/// A Book's title in the app's language: in Bangla, its Bangla title when
/// it has one (`Book.titleBn`); otherwise the title it's catalogued under.
extension BookLocalTitle on Book {
  bool _bangla(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'bn' &&
      (titleBn?.trim().isNotEmpty ?? false) &&
      titleBn != title;

  /// The title to lead with.
  String localTitle(BuildContext context) =>
      _bangla(context) ? titleBn! : title;

  /// The words on a small cover.
  String localCoverLabel(BuildContext context) =>
      _bangla(context) ? titleBn! : coverLabel;

  /// The title in the other script, for a second line; `null` when there's
  /// only one.
  String? otherTitle(BuildContext context) {
    if (_bangla(context)) return title;
    final bn = titleBn?.trim();
    return bn == null || bn.isEmpty || bn == title ? null : bn;
  }
}
