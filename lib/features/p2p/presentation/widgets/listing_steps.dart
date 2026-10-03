import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import 'listing_book_step.dart';
import 'listing_condition_step.dart';
import 'listing_photos_step.dart';
import 'listing_price_step.dart';

/// The add-listing form's four steps: the Book, its condition, photos,
/// then price and handover.
List<Step> listingSteps(AppL10n l10n, int current) => [
  for (final (i, title, content) in [
    (0, l10n.listingStepPickBook, const ListingBookStep()),
    (1, l10n.listingStepCondition, const ListingConditionStep()),
    (2, l10n.listingStepPhotos, const ListingPhotosStep()),
    (3, l10n.listingStepPriceHandover, const ListingPriceStep()),
  ])
    Step(
      title: Text(title),
      // The Stepper centres narrow content; keep it left.
      content: Align(
        alignment: AlignmentDirectional.centerStart,
        child: content,
      ),
      isActive: current >= i,
    ),
];
