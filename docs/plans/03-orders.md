# Add /orders page and the Order model

`/orders` does not exist yet — no route, no module, and nothing in the app links
to it. This issue adds the `Order` domain model, the orders page, and a "My
Orders" entry point on the profile page.

**Depends on:** `docs/plans/01-cart.md` (`CartItem`, `CenteredContent`,
`taka()`). `docs/plans/02-checkout.md` is the writer of new orders; whichever
lands second wires the two together.

## Files

- `lib/features/orders/domain/models/order.dart`:
  ```dart
  enum OrderStatus { pending, shipped, delivered, cancelled }

  enum PaymentMethod { cashOnDelivery, bkash, card }

  class Order {
    final String id;
    final DateTime placedAt;
    final List<CartItem> items;
    final double total;
    final OrderStatus status;
    final PaymentMethod paymentMethod;
    final String deliveryAddress;
  }
  ```
  `deliveryAddress` is a single formatted string, not a struct — the checkout
  form joins its fields. A real `orders` table would normalise this; for a UI
  demo it is one `Text`.
- `lib/features/orders/domain/repositories/order_repository.dart` — `abstract class OrderRepository { List<Order> getOrders(); }`, mirroring `PostRepository` / `P2pListingRepository`.
- `lib/features/orders/data/repositories/dummy_order_repository.dart` — 3 seeded past orders: one `delivered`, one `shipped`, one `cancelled`, with `placedAt` spread over recent weeks and items referencing real book ids from `DummyBookRepository`.
- `lib/features/orders/presentation/controllers/order_controller.dart`:
  - `orderRepositoryProvider`
  - `ordersProvider` — `StateProvider<List<Order>>` seeded from the repository, newest first.
  - `placeOrder(ref, Order order)` — prepends.
- `lib/features/orders/presentation/pages/orders_page.dart`
- `lib/features/orders/presentation/widgets/order_card.dart`

## Order card

A card on `palette.surface` with a `palette.border` outline, 12px radius,
containing:

- Top row: order id (`#WQ-1042` style) in `palette.text`, and a status pill on the right.
- Second row: relative date ("12 Sep 2026") in `palette.textDim`.
- A row of overlapping cover thumbnails (the `chip`-gradient placeholders, same rotation as the grid cards), capped at 4 with a "+N" bubble beyond that.
- Bottom row: "N items" in `palette.textDim`, total in `palette.text` at `FontWeight.w800`.

Status pill colours, all from `AppPalette` — no new colour constants:

| Status | Background | Text |
| --- | --- | --- |
| `pending` | `palette.surface2` | `palette.textDim` |
| `shipped` | `palette.accentSoft` | `palette.accent` |
| `delivered` | `palette.accent` | `palette.accentInk` |
| `cancelled` | `palette.surface2` | `palette.textFaint` |

There is no order detail page. Tapping a card does nothing — that is out of
scope for this demo.

## Page layout

`Scaffold` + `AppBar(title: 'My Orders')`, body a `ListView` of `OrderCard`s
inside `CenteredContent`. Newest first. Empty state: "No orders yet" in
`palette.textDim` plus a "Browse catalog" button.

## Entry point

`lib/features/profile/presentation/pages/profile_page.dart` currently has only
a header and the "My Listings" grid. Add a single tappable "My Orders" row
between `_ProfileHeader` and the "My Listings" heading — a `palette.surface`
container with a `palette.border` outline, a `Icons.receipt_long_rounded` leading
icon in `palette.textDim`, the label in `palette.text`, and a trailing chevron —
navigating with `context.pushNamed('orders')`.

One row only. Do not build out a settings list; theme switching already lives
in the Home app bar.

## Routing

```dart
GoRoute(
  path: '/orders',
  name: 'orders',
  builder: (context, state) => const OrdersPage(),
),
```

Outside the `StatefulShellRoute`, pushed from profile and `go`-navigated to from
checkout.

## Theming rules

Every colour from `AppPalette`. No `Color(0x...)` literals, no `Colors.*`.
Verify the four status pills stay legible in all six theme families — the
`cancelled` pill on `textFaint` is the one most likely to fall below contrast in
a light theme.

## Acceptance criteria

- `/orders` opens from Profile and shows the 3 seeded orders newest-first.
- Placing an order from checkout puts it at the top of the list with `pending` status.
- The card's thumbnail row handles a 1-item order and a 6-item order without overflow.
- Correct in all six theme families.
- `flutter analyze` is clean.
