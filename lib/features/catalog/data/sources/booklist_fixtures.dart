import '../../domain/entities/booklist.dart';
import '../models/booklist_model.dart';

/// Offline Booklists: Staff's, then the one fake Reader's own.
// ponytail: in-place fixture lists; the Go backend owns Booklists.
abstract final class BooklistFixtures {
  /// Staff's admin edits and the Reader's own changes edit this in place.
  static final List<BooklistModel> all = [..._seed];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed);

  static const List<BooklistModel> _seed = [
    BooklistModel(
      id: 'bl-class-8',
      kind: BooklistKind.classList,
      titleEn: 'Class 8 class list',
      titleBn: 'অষ্টম শ্রেণির বইয়ের তালিকা',
      noteEn: 'What most Dhaka schools ask for at the start of the year.',
      noteBn: 'বছরের শুরুতে ঢাকার বেশিরভাগ স্কুল যে বইগুলো চায়।',
      bookIds: [
        'bk-class8-math',
        'bk-english-grammar',
        'bk-general-math',
        'bk-matilda',
      ],
    ),
    BooklistModel(
      id: 'bl-hsc-physics',
      kind: BooklistKind.examPrep,
      titleEn: 'HSC Physics prep',
      titleBn: 'এইচএসসি পদার্থবিজ্ঞান প্রস্তুতি',
      noteEn: 'The maths HSC physics leans on, from basics to calculus.',
      noteBn: 'এইচএসসি পদার্থবিজ্ঞানে যে গণিত লাগে, ভিত্তি থেকে ক্যালকুলাস।',
      bookIds: [
        'bk-hsc-physics-1',
        'bk-hsc-higher-math',
        'bk-general-math',
        'bk-calculus',
      ],
    ),
    BooklistModel(
      id: 'bl-book-club-alchemist',
      kind: BooklistKind.bookClub,
      titleEn: 'Book club: The Alchemist month',
      titleBn: 'বুক ক্লাব: দ্য অ্যালকেমিস্ট মাস',
      noteEn: "This month's pick, and two more about following a journey.",
      noteBn: 'এই মাসের বই, আর যাত্রার পথে চলা নিয়ে আরও দুটি।',
      bookIds: ['bk-alchemist', 'bk-hobbit', 'bk-atomic'],
    ),
    BooklistModel(
      id: 'bl-summer-reads',
      kind: BooklistKind.personal,
      titleEn: 'Summer reads',
      titleBn: 'Summer reads',
      bookIds: ['bk-hpstone', 'bk-sherlock', 'bk-davinci'],
      isMine: true,
    ),
  ];
}
