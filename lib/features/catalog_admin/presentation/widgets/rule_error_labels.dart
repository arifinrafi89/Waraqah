import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_admin_rules.dart';

/// What each [RuleError] says on the form, in the current language.
extension RuleErrorLabels on AppL10n {
  String ruleError(RuleError error) => switch (error) {
    RuleError.titleBlank => adminCatalogErrTitleBlank,
    RuleError.authorMissing => adminCatalogErrAuthorMissing,
    RuleError.publisherMissing => adminCatalogErrPublisherMissing,
    RuleError.categoryMissing => adminCatalogErrCategoryMissing,
    RuleError.categoryWrongSection => adminCatalogErrCategoryWrongSection,
    RuleError.noEditions => adminCatalogErrNoEditions,
    RuleError.priceNotPositive => adminCatalogErrPriceNotPositive,
    RuleError.listPriceTooLow => adminCatalogErrListPriceTooLow,
    RuleError.stockNegative => adminCatalogErrStockNegative,
    RuleError.isbnInvalid => adminCatalogErrIsbnInvalid,
    RuleError.isbnTaken => adminCatalogErrIsbnTaken,
    RuleError.editionTaken => adminCatalogErrEditionTaken,
    RuleError.nameBlank => adminCatalogErrNameBlank,
    RuleError.nameBnBlank => adminCatalogErrNameBnBlank,
    RuleError.bannerTitleBlank => adminCatalogErrBannerTitleBlank,
    RuleError.bannerTargetBlank => adminCatalogErrBannerTargetBlank,
  };

  /// The first of [errors] among [which], for one field's error text.
  String? ruleErrorOf(Set<RuleError> errors, Set<RuleError> which) {
    final hit = errors.where(which.contains).firstOrNull;
    return hit == null ? null : ruleError(hit);
  }
}
