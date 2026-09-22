# Plan 002: Give cart totals one source of truth, and remove the dead theme-mode knob

> **Executor instructions**: Follow this plan step by step. Run every
> verification command and confirm the expected result before moving to the
> next step. If anything in the "STOP conditions" section occurs, stop and
> report — do not improvise. When done, update the status row for this plan
> in `docs/refactor/README.md`.
>
> **Drift check (run first)**:
> `git diff --stat 02b95e1..HEAD -- lib/features/cart lib/features/checkout lib/main.dart CLAUDE.md`
> If any in-scope file changed since this plan was written, compare the
> "Current state" excerpts against the live code before proceeding; on a
> mismatch, treat it as a STOP condition.

## Status

- **Priority**: P2
- **Effort**: S
- **Risk**: LOW
- **Depends on**: none (independent of plan 001 — the files do not overlap, so
  the two can be executed in either order, or in parallel on separate branches)
- **Category**: tech-debt
- **Planned at**: commit `02b95e1`, 2026-09-22

## Why this matters

The cart page and the checkout page each compute the order total, and each
one defines its own private copy of the delivery fee:

```dart
// lib/features/cart/presentation/pages/cart_page.dart:16
const _deliveryFee = 60.0;

// lib/features/checkout/presentation/pages/checkout_page.dart:18
const _deliveryFee = 60.0;
```

Change one and the cart shows the user a total that the checkout screen then
contradicts — a money bug with no compiler or test to catch it, in the two
screens where a wrong number is least acceptable. The same split runs through
the rest of the cart's domain: `CartItemTotal`, which is a cart line plus its
book plus a `lineTotal`, is declared inside `checkout_page.dart`, and an
identical private `_SummaryLine` widget is implemented in both page files.

Separately, `lib/main.dart:34` passes `themeMode: ThemeMode.light` while
`ThemeController` persists a user-selected mode (default `dark`) and
`themeState.activeFamily` already resolves the correct palette. Because no
`darkTheme` is passed to `MaterialApp.router`, the `themeMode` argument changes
nothing today — it is a dead knob that will quietly do the wrong thing the
moment someone adds `darkTheme:`. `CLAUDE.md` compounds it by claiming the theme
is "wired to system theme mode in `main.dart`", which is not true.

After this lands, the delivery fee and the order total exist once, both screens
read them, and the theme wiring matches its documentation.

## Current state

### The duplicated fee and total

```dart
// lib/features/cart/presentation/pages/cart_page.dart:14-16
const _gutter = 18.0;
// Dummy data — no delivery pricing backend yet (ADR-0001).
const _deliveryFee = 60.0;

// lib/features/cart/presentation/pages/cart_page.dart:51-52 (inside _CartBody.build)
    final subtotal = ref.watch(cartSubtotalProvider);
    final total = subtotal + _deliveryFee;
```

```dart
// lib/features/checkout/presentation/pages/checkout_page.dart:16-18
const _gutter = 18.0;
// Dummy data — no delivery pricing backend yet (ADR-0001), same fee as Cart.
const _deliveryFee = 60.0;

// lib/features/checkout/presentation/pages/checkout_page.dart:88-90 (inside build)
    final subtotal = ref.watch(cartSubtotalProvider);
    final total = subtotal + _deliveryFee;
```

The comment on the checkout copy — "same fee as Cart" — is the codebase
admitting the problem.

### `CartItemTotal`, a cart concept living in checkout

```dart
// lib/features/checkout/presentation/pages/checkout_page.dart:160-167
class CartItemTotal {
  const CartItemTotal({required this.item, required this.book});

  final CartItem item;
  final Book book;

  double get lineTotal => book.price * item.quantity;
}
```

It is public (no leading underscore) precisely because it is not a checkout
detail. Its only uses are in that same file, at lines 52, 87 and 213.

### The cart's existing providers, which this plan extends

```dart
// lib/features/cart/presentation/controllers/cart_controller.dart:54-67
final cartCountProvider = Provider<int>(
  (ref) => ref
      .watch(cartItemsProvider)
      .fold(0, (total, item) => total + item.quantity),
);

final cartSubtotalProvider = Provider<double>((ref) {
  final books = {for (final book in ref.watch(booksProvider)) book.id: book};
  return ref.watch(cartItemsProvider).fold(0.0, (total, item) {
    final book = books[item.bookId];
    if (book == null) return total;
    return total + book.price * item.quantity;
  });
});
```

### The duplicated summary-row widget

`_SummaryLine` is defined twice, once in each page file
(`cart_page.dart` and `checkout_page.dart:253`), with the same constructor
(`label`, `value`, `palette`, `emphasize`) and the same three call sites per
page (Subtotal / Delivery / Total).

### The theme wiring

```dart
// lib/main.dart:29-38
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      title: 'Waraqah',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.themeFor(themeState.activeFamily),
      routerConfig: AppRouter.router,
    );
  }
```

`AppThemeState.activeFamily` (`lib/core/theme/theme_controller.dart:30-31`)
already returns the dark family when the persisted mode is dark, so the single
`theme:` argument is always the right one and `themeMode` is inert.

### Conventions and constraints

- Shared widgets live in `lib/core/widgets/` (see `centered_content.dart`,
  `book_grid_card.dart`). A widget shared by exactly two pages of the *same*
  feature-pair belongs in the owning feature's `presentation/widgets/` —
  `lib/features/cart/presentation/widgets/cart_row.dart` is the exemplar to
  match for file shape and naming.
- Money is always rendered through `taka()` from `lib/core/utils/money.dart`.
  Never format a currency string by hand.
- `CONTEXT.md` defines **CartItem** as "A line in the cart: a `bookId` plus a
  `quantity`" and **Order** as carrying "`items` (the `CartItem`s at the moment
  of placement), `total`". Keep those names; do not rename `CartItemTotal`'s
  fields.
- `docs/adr/0001` requires domain models to mirror the planned Supabase schema.
  `CartItemTotal` is a view-model (a `CartItem` joined to its `Book`), not a
  table, so its comment must say so explicitly to avoid a future reader
  mistaking it for schema.

## Commands you will need

| Purpose | Command | Expected on success |
|---|---|---|
| Deps | `flutter pub get` | exit 0 |
| Analyze | `flutter analyze` | `No issues found!` |
| Tests | `flutter test` | `All tests passed!` (56 tests today) |
| Cart/checkout tests | `flutter test test/features/checkout/presentation/pages/checkout_page_test.dart` | all pass |

## Scope

**In scope**:
- `lib/features/cart/domain/models/cart_item.dart` (modify)
- `lib/features/cart/presentation/controllers/cart_controller.dart` (modify)
- `lib/features/cart/presentation/widgets/summary_line.dart` (create)
- `lib/features/cart/presentation/pages/cart_page.dart` (modify)
- `lib/features/checkout/presentation/pages/checkout_page.dart` (modify)
- `lib/main.dart` (modify — one line)
- `CLAUDE.md` (modify — one line)

**Out of scope** (do NOT touch):
- The cart's mutation API (`addToCart`, `setQuantity`, `removeFromCart`,
  `clearCart` free functions taking `WidgetRef`). Converting those to a
  `Notifier` is plan 003's job; doing it here would make both diffs harder to
  review.
- `lib/features/orders/` — the `Order` model stores its own `total` snapshot at
  placement time, which is correct and must not start reading a provider.
- `lib/core/theme/` — `AppTheme.lightTheme` / `AppTheme.darkTheme` are used by
  the widget tests and stay exactly as they are.
- Any visual change. The rendered subtotal, delivery and total values, their
  labels, order, spacing and styling must be pixel-identical afterwards.
- `macos/Flutter/GeneratedPluginRegistrant.swift` — modified in the working tree
  before you started; leave it.

## Git workflow

- Branch: `git switch -c advisor/002-cart-totals`
- Commit style, matching `git log`: short imperative subject, blank line,
  wrapped body explaining *why*, then:
  `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`
- Do NOT push and do NOT open a PR.

## Steps

### Step 1: Move the delivery fee and `CartItemTotal` into the cart's domain

Append to `lib/features/cart/domain/models/cart_item.dart` (keep the existing
`CartItem` class unchanged at the top of the file):

```dart
/// Flat delivery fee applied to every order. Dummy data — there is no delivery
/// pricing backend yet (ADR-0001). Cart and Checkout both read this so the two
/// screens can never show different totals.
const deliveryFee = 60.0;

/// A cart line joined to its book, with the line's money already computed.
/// A view-model, not a table — the real schema stores `cart_items` and `books`
/// separately (ADR-0001).
class CartItemTotal {
  const CartItemTotal({required this.item, required this.book});

  final CartItem item;
  final Book book;

  double get lineTotal => book.price * item.quantity;
}
```

This file now needs `import '../../../../core/models/book.dart';` at the top.

**Verify**: `flutter analyze 2>&1 | grep "cart_item.dart"` → no output.

### Step 2: Add `cartTotalProvider`

At the end of `lib/features/cart/presentation/controllers/cart_controller.dart`,
after `cartSubtotalProvider`:

```dart
final cartTotalProvider = Provider<double>(
  (ref) => ref.watch(cartSubtotalProvider) + deliveryFee,
);
```

The file already imports `../../domain/models/cart_item.dart`, so `deliveryFee`
resolves without a new import. Confirm that rather than assume it.

**Verify**: `flutter analyze` → no new errors in `cart_controller.dart`.

### Step 3: Extract the shared summary row

Create `lib/features/cart/presentation/widgets/summary_line.dart`. Move the
`_SummaryLine` class out of `cart_page.dart` verbatim, renaming it to
`SummaryLine` (public) and adding a `const SummaryLine({super.key, ...})`
constructor. Match the file shape of
`lib/features/cart/presentation/widgets/cart_row.dart`: imports, then the
single public widget class, no other top-level declarations.

Do not change the widget's layout, text styles or `emphasize` behavior — copy
the build method exactly as it stands.

**Verify**: `flutter analyze 2>&1 | grep "summary_line.dart"` → no output.

### Step 4: Point `cart_page.dart` at the shared pieces

In `lib/features/cart/presentation/pages/cart_page.dart`:

- Delete `const _deliveryFee = 60.0;` and its comment (lines 15-16). Keep
  `const _gutter = 18.0;` — that is a per-page layout constant, not shared.
- Delete the local `_SummaryLine` class.
- Add `import '../widgets/summary_line.dart';` and rename the three
  `_SummaryLine(` call sites to `SummaryLine(`.
- Replace `final total = subtotal + _deliveryFee;` with
  `final total = ref.watch(cartTotalProvider);`.
- Replace `taka(_deliveryFee)` with `taka(deliveryFee)` in the Delivery row.

**Verify**: `grep -n "_deliveryFee\|_SummaryLine" lib/features/cart/presentation/pages/cart_page.dart`
→ no output. Then
`flutter test test/features/checkout/presentation/pages/checkout_page_test.dart`
→ all pass.

### Step 5: Point `checkout_page.dart` at the shared pieces

In `lib/features/checkout/presentation/pages/checkout_page.dart`:

- Delete `const _deliveryFee = 60.0;` and its comment (lines 17-18).
- Delete the `CartItemTotal` class (lines 160-167) — it now lives in the cart's
  domain, which this file already imports via
  `import '../../../cart/domain/models/cart_item.dart';`.
- Delete the local `_SummaryLine` class and add
  `import '../../../cart/presentation/widgets/summary_line.dart';`, renaming its
  call sites to `SummaryLine(`.
- Replace `final total = subtotal + _deliveryFee;` (line 90) with
  `final total = ref.watch(cartTotalProvider);`.
- Replace `taka(_deliveryFee)` with `taka(deliveryFee)` in `_OrderSummary`.
  `_OrderSummary` is a `StatelessWidget` with no `ref`, so it must keep taking
  `subtotal` and `total` as constructor arguments exactly as it does now — do
  **not** convert it to a `ConsumerWidget`.

**Verify**: `grep -rn "_deliveryFee" lib` → no output.
`grep -c "class CartItemTotal" lib/features/checkout/presentation/pages/checkout_page.dart`
→ `0`.

### Step 6: Remove the dead `themeMode` argument

In `lib/main.dart`, delete line 34 (`themeMode: ThemeMode.light,`). Nothing
replaces it: with only `theme:` supplied, `MaterialApp` renders that theme
regardless of mode, and `AppTheme.themeFor(themeState.activeFamily)` already
encodes the user's persisted light/dark choice.

Add a one-line comment above the `theme:` argument recording why there is no
`darkTheme`:

```dart
      // One theme at a time: ThemeController resolves the persisted mode to a
      // single family, so darkTheme/themeMode would only fight it.
```

**Verify**: `grep -n "themeMode" lib/main.dart` → no output.
`flutter test test/core/theme/theme_controller_test.dart` → all pass.

### Step 7: Fix the CLAUDE.md claim

In `CLAUDE.md`, under "## Architecture", the Theming line currently reads:

> Theming: `lib/core/theme/app_theme.dart` exposes `AppTheme.lightTheme` /
> `AppTheme.darkTheme`, wired to system theme mode in `main.dart`.

Replace the clause after the comma with an accurate one: the app renders a
single theme chosen by `ThemeController`'s persisted mode + family selection
(`AppTheme.themeFor(activeFamily)`); it does not follow the system theme.
`AppTheme.lightTheme` / `AppTheme.darkTheme` are convenience getters used by
widget tests.

**Verify**: `grep -n "system theme mode" CLAUDE.md` → no output.

## Test plan

**Seam**: the router-level widget test — pump `MaterialApp.router` with
`AppRouter.router` inside a `ProviderScope`, navigate, assert on rendered text.
Prior art to model: `test/features/checkout/presentation/pages/checkout_page_test.dart`
(which already pumps `/checkout` through the router and uses an
`UncontrolledProviderScope` to drive cart state). Do **not** add a
`ProviderContainer` unit test for the new provider — it would assert on
`cartTotalProvider` by name, and a test coupled to the names this work changes
is not a safety net.

Two new test cases in a new file
`test/features/cart/presentation/pages/cart_totals_test.dart`:

1. **Cart and checkout show the same Delivery and Total** — pump `/cart` with
   the default seeded cart, read the rendered `Delivery` and `Total` strings,
   then navigate to `/checkout` and assert both strings are identical. This is
   the regression guard for the whole plan: it fails the moment anyone
   reintroduces a second fee constant and wires one screen to it.
2. **The agreement survives a cart edit** — on `/cart`, increment a line's
   quantity through the stepper, then navigate to `/checkout` and assert the
   two totals still match and are higher than in case 1.

Assert on rendered text only. Do not assert that `cartTotalProvider` exists or
was read.

The three existing checkout tests in
`test/features/checkout/presentation/pages/checkout_page_test.dart` cover the
rendered path (including that placing an order still produces a `pending` order
and empties the cart) and must keep passing with their assertions unchanged.

Verification: `flutter test` → `All tests passed!` with 58 tests (56 + 2 new).

## Done criteria

ALL must hold:

- [ ] `flutter analyze` prints `No issues found!`
- [ ] `flutter test` prints `All tests passed!` with 58 tests
- [ ] `grep -rn "_deliveryFee" lib` → no output
- [ ] `grep -rn "60.0" lib/features` → matches only
      `lib/features/cart/domain/models/cart_item.dart`
- [ ] `grep -rn "_SummaryLine" lib` → no output
- [ ] `grep -rn "class CartItemTotal" lib` → matches only
      `lib/features/cart/domain/models/cart_item.dart`
- [ ] `grep -n "themeMode" lib/main.dart` → no output
- [ ] `grep -n "system theme mode" CLAUDE.md` → no output
- [ ] `git status` shows no modified file outside the in-scope list
- [ ] Status row for plan 002 updated in `docs/refactor/README.md`

## STOP conditions

Stop and report back (do not improvise) if:

- The code at the locations in "Current state" does not match the excerpts.
- Removing `themeMode: ThemeMode.light` changes what any widget test renders.
  That would mean `activeFamily` and `themeMode` were not actually agreeing,
  which contradicts this plan's core assumption — report it instead of
  "fixing" the test.
- You find a third place that hardcodes a delivery fee or recomputes a cart
  total outside `cart_controller.dart`. Report where.
- Making `_OrderSummary` compile appears to require converting it to a
  `ConsumerWidget`. It should not — it receives its numbers as arguments.
- A step's verification fails twice after a reasonable fix attempt.

## Maintenance notes

- When a real delivery-pricing backend lands, `deliveryFee` in
  `lib/features/cart/domain/models/cart_item.dart` becomes a repository call and
  `cartTotalProvider` is the only consumer that has to change. That is the point
  of routing both screens through it.
- A reviewer should check one thing above all: that the numbers rendered on
  `/cart` and `/checkout` are unchanged. The safest review is to run the app and
  compare both screens against the previous build, since no test asserts the
  exact rendered total string.
- Deferred on purpose: `const _gutter = 18.0;` is duplicated across several page
  files. It is a layout constant, not money, and a wrong gutter is visible
  rather than silent — not worth a shared constant and the import it costs.
- `SummaryLine` lives under `cart/presentation/widgets/` rather than
  `core/widgets/` because only cart and checkout use it. If a third feature ever
  needs it, promote it to `core/widgets/` then — not before.
