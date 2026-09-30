import '../../../../core/models/book.dart';
import '../models/catalog_record_models.dart';

/// Offline Categories. Ids are what `Book.categoryId` points at.
abstract final class CategoryFixtures {
  /// JSON for the Categories of the Section named [section].
  static List<Map<String, dynamic>> forSection(String? section) => [
    for (final c in all)
      if (c.section.name == section) c.toJson(),
  ];

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
    CategoryModel(
      id: 'cat-bcs-prep',
      section: Section.admissionJobPrep,
      nameEn: 'BCS Preparation',
      nameBn: 'বিসিএস প্রস্তুতি',
    ),
    CategoryModel(
      id: 'cat-admission-test',
      section: Section.admissionJobPrep,
      nameEn: 'University Admission',
      nameBn: 'বিশ্ববিদ্যালয় ভর্তি',
    ),
    CategoryModel(
      id: 'cat-textbooks',
      section: Section.schoolCollege,
      nameEn: 'Textbooks',
      nameBn: 'পাঠ্যবই',
    ),
    CategoryModel(
      id: 'cat-school-guides',
      section: Section.schoolCollege,
      nameEn: 'Guides & Grammar',
      nameBn: 'গাইড ও ব্যাকরণ',
    ),
    CategoryModel(
      id: 'cat-programming',
      section: Section.skillsTech,
      nameEn: 'Programming',
      nameBn: 'প্রোগ্রামিং',
    ),
    CategoryModel(
      id: 'cat-data-systems',
      section: Section.skillsTech,
      nameEn: 'Data & Systems',
      nameBn: 'ডেটা ও সিস্টেম',
    ),
    CategoryModel(
      id: 'cat-picture-books',
      section: Section.children,
      nameEn: 'Picture Books',
      nameBn: 'ছবির বই',
    ),
    CategoryModel(
      id: 'cat-kids-stories',
      section: Section.children,
      nameEn: 'Story Books',
      nameBn: 'গল্পের বই',
    ),
  ];
}
