import '../models/catalog_record_models.dart';

/// Offline Authors. Ids are what `Book.authorId` points at.
abstract final class AuthorFixtures {
  static const List<AuthorModel> all = [
    AuthorModel(id: 'au-tolkien', name: 'J. R. R. Tolkien'),
    AuthorModel(id: 'au-rowling', name: 'J. K. Rowling'),
    AuthorModel(id: 'au-brown', name: 'Dan Brown'),
    AuthorModel(id: 'au-stewart', name: 'James Stewart'),
    AuthorModel(id: 'au-thiel', name: 'Peter Thiel'),
    AuthorModel(id: 'au-doyle', name: 'Arthur Conan Doyle'),
    AuthorModel(
      id: 'au-harari',
      name: 'Yuval Noah Harari',
      nameBn: 'ইউভাল নোয়া হারারি',
      bio: 'Israeli historian whose books trace the big arcs of human history.',
    ),
    AuthorModel(id: 'au-clear', name: 'James Clear'),
    AuthorModel(id: 'au-martin', name: 'Robert C. Martin'),
    AuthorModel(id: 'au-bukhari', name: 'Imam al-Bukhari'),
    AuthorModel(id: 'au-ghazali', name: 'Imam al-Ghazali'),
    AuthorModel(id: 'au-ibn-qayyim', name: 'Ibn Qayyim al-Jawziyya'),
    AuthorModel(id: 'au-ibn-khaldun', name: 'Ibn Khaldun'),
    AuthorModel(id: 'au-sayyid-sabiq', name: 'Sayyid Sabiq'),
    AuthorModel(id: 'au-mubarakpuri', name: 'Safi-ur-Rahman al-Mubarakpuri'),
    AuthorModel(id: 'au-nawawi', name: 'Imam an-Nawawi'),
    AuthorModel(id: 'au-ibn-kathir', name: 'Ibn Kathir'),
    AuthorModel(id: 'au-editorial', name: 'Waraqah Editorial Board'),
    AuthorModel(id: 'au-nctb', name: 'NCTB'),
    AuthorModel(id: 'au-wren-martin', name: 'P. C. Wren & H. Martin'),
    AuthorModel(id: 'au-hunt-thomas', name: 'Andrew Hunt & David Thomas'),
    AuthorModel(id: 'au-kleppmann', name: 'Martin Kleppmann'),
    AuthorModel(id: 'au-carle', name: 'Eric Carle'),
    AuthorModel(id: 'au-dahl', name: 'Roald Dahl'),
  ];
}
