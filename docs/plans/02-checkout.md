# Add /checkout single-page mock checkout

`/checkout` does not exist yet — there is no route and no feature module. This
issue adds both. Payment is mocked; no real payment credentials are handled
anywhere (`ARCHITECTURE.md` §10).

**Depends on:** `docs/plans/01-cart.md` (needs `cartItemsProvider`,
`cartSubtotalProvider`, `CenteredContent`, `taka()`).

## Scope

One screen, not a multi-step stepper: the whole flow has to be visible in a
single glance during the demo. Order summary, delivery address, payment method,
place order.

## Files

- `lib/features/checkout/presentation/pages/checkout_page.dart` — the page. It is a `ConsumerStatefulWidget` because the address form needs `TextEditingController`s and a `GlobalKey<FormState>`.

No controller file: checkout owns no state beyond the form, and placing an order
delegates to the orders controller from `docs/plans/03-orders.md`.

## Page layout

`Scaffold` + `AppBar(title: 'Checkout')`, body a scrolling `Column` inside
`CenteredContent`, with three sections. Each section is a card on
`palette.surface` with a `palette.border` outline, a 12px radius, and a section
heading in `palette.text` at `fontWeight: FontWeight.w800`, `fontSize: 15` —
the same heading style as "My Listings" in `profile_page.dart:38-45`.

**1. Order summary** — one compact line per cart item (title × quantity, line
total), then Subtotal / Delivery / Total. Read-only; editing happens back in the
cart.

**2. Delivery address** — a `Form` with `TextFormField`s: Full name, Phone,
Address line, City. Prefill name from `currentProfileProvider`. Each field is
`validator`-checked for non-empty, because "Place order" must not fire on a
blank form.

**3. Payment method** — three `RadioListTile`s: Cash on delivery (default),
bKash, Card. All three are mocked; add a short note in `palette.textFaint`
under the group saying payment is simulated for this demo.

Pinned bottom bar: total on the left, a full-width-ish `ElevatedButton` "Place
order" in `palette.accent` / `palette.accentInk`.

## Place order behaviour

1. `_formKey.currentState!.validate()` — bail out if invalid.
2. Build an `Order` (see `docs/plans/03-orders.md`) from the current cart items, total, selected payment method and the typed address, with `status: OrderStatus.pending` and `placedAt: DateTime.now()`.
3. Prepend it to `ordersProvider`.
4. Clear `cartItemsProvider`.
5. `context.goNamed('orders')` — `go`, not `push`, so back from the orders page does not land on a checkout for an order already placed.
6. Show a `SnackBar` "Order placed" on arrival.

## Routing

Add to `lib/app/router/app_router.dart`, outside the `StatefulShellRoute`:

```dart
GoRoute(
  path: '/checkout',
  name: 'checkout',
  builder: (context, state) => const CheckoutPage(),
),
```

## Theming rules

Every colour from `AppPalette`. No `Color(0x...)` literals, no `Colors.*`. Note
that `RadioListTile` and `TextFormField` pull from the `ThemeData` in
`lib/core/theme/app_theme.dart` — if a field's border or a radio's fill looks
off in any of the six themes, fix it in `app_theme.dart` so every form in the
app benefits, rather than overriding colours on this page.

## Acceptance criteria

- Reaching `/checkout` with an empty cart is impossible through the UI; if it happens anyway (deep link), the page shows the empty-cart state instead of a zero-total form.
- "Place order" on an invalid form shows field errors and does not create an order.
- After a successful order the cart is empty and the Home badge is gone.
- Correct in all six theme families.
- `flutter analyze` is clean.
