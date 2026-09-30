import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/widgets/app_buttons.dart';
import 'package:waraqah/features/admin/admin_routes.dart';
import 'package:waraqah/features/admin/domain/entities/admin_section.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/checkout/presentation/widgets/gift_card.dart';
import 'package:waraqah/features/checkout/presentation/widgets/gift_fields.dart';

import 'helpers/app_harness.dart';

Future<void> _toCheckout(
  WidgetTester tester, {
  String bookId = 'bk-atomic',
  String? edition,
}) async {
  await openApp(tester, CatalogRoutes.bookDetailFor(bookId), role: 'reader');
  if (edition != null) await tester.tap(find.text(edition));
  await tester.tap(find.text('Buy now'));
  await settle(tester);
  await tester.tap(find.text('Checkout'));
  await settle(tester);
}

Future<void> _scrollTo(WidgetTester tester, Finder finder) async {
  await tester.dragUntilVisible(
    finder,
    find.byType(ListView),
    const Offset(0, -200),
  );
  await tester.pump();
}

Finder _in(Type parent, Type child) =>
    find.descendant(of: find.byType(parent), matching: find.byType(child));

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a gift needs a name, can be wrapped and reaches the order', (
    tester,
  ) async {
    await _toCheckout(tester);
    final placeOrder = find.widgetWithText(PrimaryButton, 'Place order');
    bool canPlace() =>
        tester.widget<PrimaryButton>(placeOrder).onPressed != null;

    await _scrollTo(tester, find.text('Send as a gift'));
    await tester.tap(_in(GiftCard, Switch).first);
    await tester.pump();
    expect(canPlace(), isFalse, reason: 'no name yet');

    final fields = _in(GiftFields, TextField);
    await tester.enterText(fields.first, 'Nabila');
    await tester.enterText(fields.last, 'Happy birthday!');
    await tester.ensureVisible(_in(GiftFields, Switch));
    await settle(tester);
    await tester.tap(_in(GiftFields, Switch));
    await tester.pump();
    expect(canPlace(), isTrue);
    // ৳590 + ৳60 delivery + ৳40 gift wrap.
    expect(find.text('৳690'), findsWidgets);

    await tester.tap(placeOrder);
    await settle(tester);
    expect(
      find.text(
        "It's a gift for Nabila: we'll add your card and leave the prices out.",
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Track order'));
    await settle(tester);
    await tester.scrollUntilVisible(find.text('Gift for Nabila'), 200);
    expect(find.text('“Happy birthday!”'), findsOneWidget);
    expect(find.text('Gift-wrapped'), findsOneWidget);
  });

  testWidgets('eBook-only orders have no gift option', (tester) async {
    await _toCheckout(tester, bookId: 'bk-sapiens', edition: 'eBook · English');
    expect(find.byType(GiftCard), findsOneWidget);
    expect(find.text('Send as a gift'), findsNothing);
  });

  testWidgets('staff are told how to pack a gift', (tester) async {
    await openApp(
      tester,
      AdminRoutes.section(AdminSection.orders),
      role: 'support',
    );
    expect(find.text('Gift for Nabila'), findsOneWidget);
    expect(find.text('Add the card and leave the prices out.'), findsOneWidget);
  });
}
