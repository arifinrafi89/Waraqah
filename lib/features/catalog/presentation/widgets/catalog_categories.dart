import '../../../../l10n/app_localizations.dart';

/// Maps the category pills to the `category` values stored on a [Book].
///
/// `null` is the "All" pill, which clears the filter.
class CatalogCategories {
  const CatalogCategories(this.l10n);

  final AppL10n l10n;

  static const List<String?> values = [
    null,
    'Islamic Studies',
    'Academic',
    'Fiction',
    'Self-Help',
    'Business',
  ];

  List<String> get labels => [
    l10n.catalogCategoryAll,
    l10n.catalogCategoryIslamic,
    l10n.catalogCategoryAcademic,
    l10n.catalogCategoryFiction,
    l10n.catalogCategorySelfHelp,
    l10n.catalogCategoryBusiness,
  ];

  static int indexOf(String? category) {
    final index = values.indexOf(category);
    return index < 0 ? 0 : index;
  }
}
