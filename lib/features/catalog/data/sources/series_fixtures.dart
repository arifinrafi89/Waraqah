import '../models/book_extras_model.dart';

/// Series for the fake API, in reading order. Books Waraqah sells carry
/// their `bookId` (the fake API adds their covers); the rest are listed so
/// readers see the whole series.
abstract final class SeriesFixtures {
  static const List<BookSeriesModel> all = [
    BookSeriesModel(
      name: 'Harry Potter',
      entries: [
        SeriesEntryModel(
          position: 1,
          title: "Harry Potter and the Philosopher's Stone",
          bookId: 'bk-hpstone',
        ),
        SeriesEntryModel(position: 2, title: 'The Chamber of Secrets'),
        SeriesEntryModel(position: 3, title: 'The Prisoner of Azkaban'),
        SeriesEntryModel(position: 4, title: 'The Goblet of Fire'),
        SeriesEntryModel(position: 5, title: 'The Order of the Phoenix'),
        SeriesEntryModel(position: 6, title: 'The Half-Blood Prince'),
        SeriesEntryModel(position: 7, title: 'The Deathly Hallows'),
      ],
    ),
    BookSeriesModel(
      name: 'Robert Langdon',
      entries: [
        SeriesEntryModel(position: 1, title: 'Angels & Demons'),
        SeriesEntryModel(
          position: 2,
          title: 'The Da Vinci Code',
          bookId: 'bk-davinci',
        ),
        SeriesEntryModel(position: 3, title: 'The Lost Symbol'),
        SeriesEntryModel(position: 4, title: 'Inferno'),
        SeriesEntryModel(position: 5, title: 'Origin'),
      ],
    ),
    BookSeriesModel(
      name: 'Sherlock Holmes novels',
      entries: [
        SeriesEntryModel(
          position: 1,
          title: 'A Study in Scarlet',
          bookId: 'bk-sherlock',
        ),
        SeriesEntryModel(position: 2, title: 'The Sign of the Four'),
        SeriesEntryModel(position: 3, title: 'The Hound of the Baskervilles'),
        SeriesEntryModel(position: 4, title: 'The Valley of Fear'),
      ],
    ),
    BookSeriesModel(
      name: 'Middle-earth',
      entries: [
        SeriesEntryModel(position: 1, title: 'The Hobbit', bookId: 'bk-hobbit'),
        SeriesEntryModel(position: 2, title: 'The Fellowship of the Ring'),
        SeriesEntryModel(position: 3, title: 'The Two Towers'),
        SeriesEntryModel(position: 4, title: 'The Return of the King'),
      ],
    ),
  ];

  static BookSeriesModel? forBook(String bookId) =>
      all.where((s) => s.entries.any((e) => e.bookId == bookId)).firstOrNull;
}
