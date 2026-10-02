import '../models/catalog_record_models.dart';
import 'book_fixtures.dart';

/// Offline Subjects. Ids are what `Book.subjectId` points at.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
abstract final class SubjectFixtures {
  /// JSON for every Subject, or only those with a visible Book in the
  /// Section named [section].
  static List<Map<String, dynamic>> forSection(String? section) {
    final used = {
      for (final b in BookFixtures.all)
        if (!b.hidden && b.section.name == section) b.subjectId,
    };
    return [
      for (final s in all)
        if (section == null || used.contains(s.id)) s.toJson(),
    ];
  }

  /// Staff's admin edits change this list in place.
  static final List<SubjectModel> all = [..._seed];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed);

  static const List<SubjectModel> _seed = [
    SubjectModel(id: 'sub-bangla', nameEn: 'Bangla', nameBn: 'বাংলা'),
    SubjectModel(id: 'sub-english', nameEn: 'English', nameBn: 'ইংরেজি'),
    SubjectModel(id: 'sub-math', nameEn: 'Mathematics', nameBn: 'গণিত'),
    SubjectModel(
      id: 'sub-higher-math',
      nameEn: 'Higher Mathematics',
      nameBn: 'উচ্চতর গণিত',
    ),
    SubjectModel(id: 'sub-science', nameEn: 'Science', nameBn: 'বিজ্ঞান'),
    SubjectModel(id: 'sub-physics', nameEn: 'Physics', nameBn: 'পদার্থবিজ্ঞান'),
    SubjectModel(id: 'sub-chemistry', nameEn: 'Chemistry', nameBn: 'রসায়ন'),
    SubjectModel(id: 'sub-biology', nameEn: 'Biology', nameBn: 'জীববিজ্ঞান'),
    SubjectModel(
      id: 'sub-ict',
      nameEn: 'ICT',
      nameBn: 'তথ্য ও যোগাযোগ প্রযুক্তি',
    ),
    SubjectModel(
      id: 'sub-gk',
      nameEn: 'General Knowledge',
      nameBn: 'সাধারণ জ্ঞান',
    ),
    SubjectModel(
      id: 'sub-accounting',
      nameEn: 'Accounting',
      nameBn: 'হিসাববিজ্ঞান',
    ),
  ];
}
