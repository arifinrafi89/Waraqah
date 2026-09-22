# Add /cart page with working in-memory cart

`/cart` is currently a `PlaceholderPage`. This issue replaces it with a real cart
screen and makes the existing "Add to cart" buttons do something. It also lands
three small shared pieces that the next four pages all depend on, so it goes
first.

## Scope

Only books from the primary catalog go in the cart. P2P listings are
deliberately excluded — second-hand listings are one-of-a-kind and
`ARCHITECTURE.md` §7.2 keeps P2P independent of the primary catalog. The P2P
detail page keeps its own action and is not touched here.

Cart state lives in memory for the session only (a Riverpod `StateProvider`,
matching how `postsProvider` and `p2pListingsProvider` already work). It is not
persisted; restarting the app empties the cart. There is no backend — see
`docs/adr/0001`.

## Shared pieces landing in this issue

1. **`lib/core/widgets/centered_content.dart`** — a `CenteredContent` widget
   wrapping its child in a `ConstrainedBox(maxWidth: 720)` plus
   `Align(alignment: Alignment.topCenter)`. On a phone this is a no-op; on a
   desktop window it stops the page stretching edge to edge. Cart, checkout,
   orders, search and AI chat all use it.
2. **`lib/core/utils/money.dart`** — `String taka(double amount) =>
   '৳${amount.toStringAsFixed(0)}';`. This format is currently inlined at
   `book_grid_card.dart:139`, `book_grid_card.dart:149` and
   `p2p_grid_card.dart:124`; point those three at the helper too, so there is
   one definition instead of thirteen.
3. **`GlassContainer` palette fix** — `lib/core/widgets/glass_container.dart`
   hardcodes `Colors.white` for both its tint (line 32) and its border (line
   35). That reads wrong in the three light themes (Nord, Tokyo Day,
   Catppuccin Latte). Default the tint to `palette.surface` and the border to
   `palette.border`, keeping the existing `color` parameter as an override.
   `AppBottomNav` is the current user and improves for free.

## Files

- `lib/features/cart/domain/models/cart_item.dart` — `CartItem { String bookId; int quantity; }`.
- `lib/features/cart/presentation/controllers/cart_controller.dart`:
  - `cartItemsProvider` — `StateProvider<List<CartItem>>`, seeded with 2 items so the badge and the page are populated on first open.
  - `addToCart(ref, bookId)` — increments quantity if the book is already in the cart, otherwise appends with quantity 1.
  - `setQuantity(ref, bookId, qty)` — removes the item when `qty` hits 0.
  - `removeFromCart(ref, bookId)`.
  - `cartCountProvider` — total quantity across items, derived.
  - `cartSubtotalProvider` — sum of `book.price * quantity`, derived by joining against `booksProvider`.
- `lib/features/cart/presentation/pages/cart_page.dart` — the page.
- `lib/features/cart/presentation/widgets/cart_row.dart` — one line item.

## Page layout

`Scaffold` + `AppBar(title: 'Cart')`, body wrapped in `CenteredContent`.

Each `CartRow`: cover thumbnail (the `chip`-gradient placeholder the grid cards
already use, same rotation), title, author, unit price, a quantity stepper
(`−` / count / `+`), and a trailing delete icon button. Row sits on
`palette.surface` with a `palette.border` outline and a 12px radius, matching
`_AppBarIconButton` and the existing cards.

Pinned to the bottom: a summary bar showing Subtotal, Delivery (a flat
`৳60` constant — it is dummy data, name it as such in a comment), and Total, then
a full-width `ElevatedButton` "Proceed to checkout" in `palette.accent` /
`palette.accentInk`, matching `book_detail_page.dart:108-121`. The button
navigates to `/checkout` and is disabled when the cart is empty.

Empty state: centred icon + "Your cart is empty" in `palette.textDim` + a
"Browse catalog" button going to `/catalog`.

## Wiring up the existing buttons

- `lib/core/widgets/book_grid_card.dart:164` — `onAddToCart` currently falls back to `() {}`. Pass a real callback from both call sites (`home_page.dart:470`, `catalog_page.dart:48`) that calls `addToCart` and shows a `SnackBar` ("Added to cart").
- `lib/features/catalog/presentation/pages/book_detail_page.dart:109` — the "Add to cart" `ElevatedButton` has an empty `onPressed`. Same treatment.
- `lib/features/home/presentation/pages/home_page.dart:165` — `badgeCount: 2` is hardcoded. Change to `ref.watch(cartCountProvider)`, passing `null` when the count is 0 so the badge disappears.

## Routing

Replace the `/cart` `PlaceholderPage` in `lib/app/router/app_router.dart` with
`CartPage`. It stays outside the `StatefulShellRoute`, so it is pushed and keeps
its back button, per ADR-0002.

## Theming rules

Every colour comes from `Theme.of(context).extension<AppPalette>()!`. No
`Color(0x...)` literals, no `Colors.*` anywhere in the new files. Available
tokens: `bg`, `surface`, `surface2`, `border`, `text`, `textDim`, `textFaint`,
`accent`, `accentInk`, `accentSoft`, `chip1`-`chip4` (and `chips` for the
rotation). The page must look correct in all six theme families — check at least
one light (Nord) and one dark (Forest) before closing.

## Acceptance criteria

- Adding the same book twice increments the quantity instead of creating a second row.
- The Home app-bar badge tracks the real cart count and vanishes at 0.
- The quantity stepper's `−` at quantity 1 removes the row.
- The subtotal updates immediately on every quantity change.
- "Proceed to checkout" is disabled on an empty cart.
- `flutter analyze` is clean.
