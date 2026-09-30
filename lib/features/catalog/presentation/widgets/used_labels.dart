import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';

/// Reader-facing words for used copies, in the current language. The cart
/// uses these too.
extension UsedLabels on AppL10n {
  String conditionLabel(BookCondition condition) => switch (condition) {
    BookCondition.likeNew => bookConditionLikeNew,
    BookCondition.veryGood => bookConditionVeryGood,
    BookCondition.good => bookConditionGood,
    BookCondition.acceptable => bookConditionAcceptable,
  };
}
