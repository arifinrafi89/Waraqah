import '../../../../core/models/book.dart';
import '../models/catalog_record_models.dart';

/// Offline Categories. Ids are what `Book.categoryId` points at.
abstract final class CategoryFixtures {
  static const List<CategoryModel> all = [
    CategoryModel(
      id: 'cat-islamic-studies',
      section: Section.religious,
      nameEn: 'Islamic Studies',
      nameBn: 'ইসলামিক স্টাডিজ',
    ),
    CategoryModel(
      id: 'cat-academic',
      section: Section.academic,
      nameEn: 'Academic',
      nameBn: 'একাডেমিক',
    ),
    CategoryModel(
      id: 'cat-fiction',
      section: Section.literature,
      nameEn: 'Fiction',
      nameBn: 'ফিকশন',
    ),
    CategoryModel(
      id: 'cat-self-help',
      section: Section.nonFiction,
      nameEn: 'Self-Help',
      nameBn: 'সেলফ-হেল্প',
    ),
    CategoryModel(
      id: 'cat-business',
      section: Section.nonFiction,
      nameEn: 'Business',
      nameBn: 'ব্যবসা',
    ),
  ];
}
