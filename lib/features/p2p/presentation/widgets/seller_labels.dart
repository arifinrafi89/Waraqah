import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/seller_profile.dart';

/// Reader-facing words for a seller, in the current language.
extension SellerLabels on AppL10n {
  /// "4.8 · 12 ratings", or "No ratings yet".
  String ratingLine(SellerProfile seller) => switch (seller.ratingAverage) {
    final average? => sellerRating(
      average.toStringAsFixed(1),
      seller.ratingCount,
    ),
    null => sellerNoRatings,
  };
}

/// "Feb 2025", in the current language.
String memberSinceDate(BuildContext context, DateTime date) =>
    DateFormat.yMMM(Localizations.localeOf(context).toLanguageTag())
        .format(date);
