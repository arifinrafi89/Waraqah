import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_area.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_estimate.dart';
import 'package:waraqah/features/catalog/presentation/providers/edition_providers.dart';

Edition _edition({
  BookFormat format = BookFormat.paperback,
  int stock = 10,
  bool preorder = false,
  int price = 500,
  String id = 'e1',
}) => Edition(
  id: id,
  format: format,
  language: BookLanguage.english,
  priceBdt: price,
  stock: stock,
  isPreorder: preorder,
);

void main() {
  group('DeliveryEstimate', () {
    const inside = DeliveryArea.insideDhaka;
    const outside = DeliveryArea.outsideDhaka;

    test('printed books in stock: 1–2 days in Dhaka, 3–5 outside', () {
      final inDhaka = DeliveryEstimate.of(_edition(), inside) as ShipsInDays;
      final outDhaka = DeliveryEstimate.of(_edition(), outside) as ShipsInDays;
      expect((inDhaka.minDays, inDhaka.maxDays), (1, 2));
      expect((outDhaka.minDays, outDhaka.maxDays), (3, 5));
    });

    test('eBooks download straight away, wherever the reader is', () {
      final ebook = _edition(format: BookFormat.ebook);
      expect(DeliveryEstimate.of(ebook, outside), isA<InstantDownload>());
    });

    test('pre-orders ship on release', () {
      final preorder = _edition(stock: 0, preorder: true);
      expect(DeliveryEstimate.of(preorder, inside), isA<ShipsOnRelease>());
    });

    test('out-of-stock editions are unavailable', () {
      expect(
        DeliveryEstimate.of(_edition(stock: 0), inside),
        isA<Unavailable>(),
      );
    });
  });

  group('chosenEdition', () {
    final book = Book(
      id: 'b1',
      title: 'T',
      author: 'A',
      category: 'C',
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        _edition(id: 'cheap', price: 300),
        _edition(id: 'pricey', price: 900),
      ],
    );

    test('nothing chosen means the From-price edition', () {
      expect(book.chosenEdition(null).id, 'cheap');
    });

    test('a chosen edition is used; an unknown id falls back', () {
      expect(book.chosenEdition('pricey').id, 'pricey');
      expect(book.chosenEdition('gone').id, 'cheap');
    });
  });
}
